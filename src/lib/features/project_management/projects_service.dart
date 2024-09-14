import 'dart:io';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:path/path.dart' as Path;
import 'package:yaml/yaml.dart';
import 'package:yaml_magic/yaml_magic.dart';

import '../log/log.dart';
import '../storage/i_storage.dart';
import 'open_project_result.dart';
import 'project.dart';

final class ProjectsService extends ChangeNotifier {
  ProjectsService._({required IStorage storage}) : _storage = storage;

  final IStorage _storage;

  static Future<ProjectsService> factory() async {
    logInfo("Initializing");

    return ProjectsService._(storage: GetIt.I<IStorage>()).._initialize();
  }

  IList<Project> _projects = IList();
  IList<Project> get projects => _projects;

  void _initialize() {
    final projectsJson = _storage.getStringList("projects") ?? [];

    _projects = projectsJson.map((j) => Project.fromJson(j)).toIList(
          const ConfigList(cacheHashCode: true),
        );

    logInfo("Projects: ${_projects}");
  }

  void _saveProjects() {
    logInfo("Saving projects");

    _storage.setStringList(
      "projects",
      _projects.map((p) => p.toJson()).toList(),
    );
  }

  void _addProject(Project project) {
    logInfo("Adding ${project}");

    final existingProjectIndex = _projects.indexWhere(
      (p) => p.path == project.path,
    );

    if (existingProjectIndex == -1) {
      _projects = _projects.insert(0, project);
    } else {
      _projects = _projects.replace(existingProjectIndex, project);
    }

    _saveProjects();
    notifyListeners();
  }

  void removeProject(Project project) {
    logInfo("Removing ${project}");

    final existingProjectIndex = _projects.indexWhere(
      (p) => p == project,
    );

    if (existingProjectIndex != -1) {
      _projects = _projects.removeAt(existingProjectIndex);
    }

    _saveProjects();
    notifyListeners();
  }

  Future<OpenProjectResult> openProject(String yamlFilePath) async {
    logInfo("Opening ${yamlFilePath}");

    try {
      YamlMagic.load(yamlFilePath);

      final path = Path.dirname(yamlFilePath);
      final name = Path.basename(path);
      final fileName = Path.basename(yamlFilePath);
      final project = Project(path: path, name: name, fileName: fileName);

      _addProject(project);

      return OpenProjectSuccessResult(project);
    } on YamlException catch (ex, st) {
      logError(ex, st, ex.message);

      final codeSpan = <String>[];

      if (ex.span != null) {
        try {
          final lines = await File(yamlFilePath).readAsLines();

          for (var l = 0; l < lines.length; l++) {
            if (l >= ex.span!.start.line && l <= ex.span!.end.line) {
              if (l > 0) {
                codeSpan.add("${l}:${lines[l - 1]}");
              }

              codeSpan.add("${l + 1}:${lines[l]}");

              if (l < lines.length - 1) {
                codeSpan.add("${l + 2}:${lines[l + 1]}");
              }
            }
          }

          return OpenProjectInvalidYamlResult(
            errorLine: ex.span!.start.line,
            yamlLines: codeSpan.toIList(),
          );
        } catch (innerEx, innerStackTrace) {
          logError(innerEx, innerStackTrace);

          return OpenProjectUnknownErrorResult(
            exceptionName: "${ex.runtimeType} + ${innerEx.runtimeType}",
            exceptionMessage: ex.message,
          );
        }
      }

      return OpenProjectInvalidYamlResult(
        errorLine: -1,
        yamlLines: IList<String>(const ["unknown"]),
      );
    } on YamlIOException catch (ex, st) {
      logError(ex, st, ex.message);

      return OpenProjectUnknownErrorResult(
        exceptionName: "${ex.runtimeType}",
        exceptionMessage: ex.message,
      );
    } catch (ex, st) {
      logError(ex, st);

      return OpenProjectUnknownErrorResult(
        exceptionName: "${ex.runtimeType}",
        exceptionMessage: ex.toString(),
      );
    }
  }
}
