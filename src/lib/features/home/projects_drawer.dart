import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:path/path.dart' as Path;
import 'package:super_context_menu/super_context_menu.dart';
import 'package:url_launcher/url_launcher.dart' as Launcher;
import 'package:watch_it/watch_it.dart';

import '../../gen/strings.g.dart';
import '../dialogs/dialogs.dart';
import '../project_management/open_project_result.dart';
import '../project_management/project.dart';
import '../project_management/projects_service.dart';

class ProjectsDrawer extends StatelessWidget with WatchItMixin {
  const ProjectsDrawer({required this.roundCorners, super.key});

  final bool roundCorners;

  static Future<void> _createNewProject(BuildContext context) async {
    final path = await FilePicker.platform.getDirectoryPath(
      dialogTitle: t.projectsDrawer.createNewProject,
    );

    if (path == null || context.mounted == false) {
      return;
    }

    final existingFile = File(Path.join(path, "docker-compose.yml"));

    if (existingFile.existsSync()) {
      context
          .showOKDialog(
            title: t.projectsDrawer.createNewProject,
            message: t.openProjectErrors.fileAlreadyExists,
          )
          .ignore();

      return;
    }

    await _openDockerComposeFile(
      context,
      Path.join(path, "docker-compose.yml"),
    );
  }

  static Future<void> _openExistingProject(BuildContext context) async {
    final pickedFile = await FilePicker.platform.pickFiles(
      dialogTitle: t.projectsDrawer.openExistingProject,
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ["yml", "yaml"],
      lockParentWindow: true,
    );

    if (pickedFile == null || context.mounted == false) {
      return;
    }

    await _openDockerComposeFile(
      context,
      pickedFile.xFiles.first.path,
    );
  }

  static Future<void> _openDockerComposeFile(
    BuildContext context,
    String yamlFilePath,
  ) async {
    final result = await GetIt.I<ProjectsService>().openProject(yamlFilePath);

    if (context.mounted == false) {
      return;
    }

    switch (result) {
      case OpenProjectSuccessResult():
        break;
      case OpenProjectInvalidYamlResult():
        context
            .showOKDialog(
              title: t.oops,
              message: t.openProjectErrors.parseErrorWhileOpeningFile(
                errorLine: result.errorLine,
                yamlLines: result.yamlLines.join("\n"),
              ),
            )
            .ignore();

      case OpenProjectUnknownErrorResult():
        context
            .showOKDialog(
              title: t.oops,
              message: t.openProjectErrors.unknownFailureWhileOpeningFile(
                details: "${result.exceptionName} (${result.exceptionMessage})",
              ),
            )
            .ignore();
    }
  }

  Menu _buildContextMenu(BuildContext context, Project project) {
    final removeProjectMenuAction = MenuAction(
      callback: () => _removeProject(context, project),
      title: t.projectsDrawer.removeProject,
      image: MenuImage.icon(HugeIcons.strokeRoundedDelete01),
    );

    switch (defaultTargetPlatform) {
      case TargetPlatform.android ||
            TargetPlatform.fuchsia ||
            TargetPlatform.iOS:
        return Menu(children: [removeProjectMenuAction]);
      default:
        return Menu(
          children: [
            MenuAction(
              callback: () => _openProjectFolder(context, project),
              title: t.projectsDrawer.openFolder,
              image: MenuImage.icon(HugeIcons.strokeRoundedFolder01),
            ),
            MenuSeparator(),
            removeProjectMenuAction,
          ],
        );
    }
  }

  void _openProjectFolder(BuildContext context, Project project) {
    Launcher.launchUrl(Uri(scheme: "file", path: project.path));
  }

  Future<void> _removeProject(
    BuildContext context,
    Project project,
  ) async {
    if (await context.showConfirmDialog(
          title: t.projectsDrawer.removeProject,
          message: t.projectsDrawer.removeProjectConfirmation,
        ) ==
        false) {
      return;
    }

    GetIt.I<ProjectsService>().removeProject(project);
  }

  @override
  Widget build(BuildContext context) {
    final projects = watchPropertyValue((ProjectsService ps) => ps.projects);

    return Drawer(
      width: roundCorners ? null : 300,
      shape: roundCorners ? null : const Border(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            title: Text(t.projectsDrawer.projects),
            backgroundColor: Colors.transparent,
            actions: [
              IconButton(
                onPressed: () => _createNewProject(context),
                icon: const Icon(HugeIcons.strokeRoundedAddCircle),
              ),
              IconButton(
                onPressed: () => _openExistingProject(context),
                icon: const Icon(HugeIcons.strokeRoundedFolderOpen),
              ),
            ],
          ),
          if (projects.isEmpty)
            Expanded(
              child: Center(
                child: Text(t.projectsDrawer.noProjects),
              ),
            ),
          for (final project in projects)
            ContextMenuWidget(
              menuProvider: (_) => _buildContextMenu(context, project),
              child: ListTile(
                onTap: () {},
                title: Text(project.name),
                subtitle: Text(project.path),
              ),
            ),
        ],
      ),
    );
  }
}
