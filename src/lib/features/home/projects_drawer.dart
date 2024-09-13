import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:path/path.dart' as Path;
import 'package:yaml/yaml.dart';
import 'package:yaml_magic/yaml_magic.dart';

import '../../gen/strings.g.dart';

class ProjectsDrawer extends StatelessWidget {
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
      showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(t.projectsDrawer.createNewProject),
          content: Text(t.openProjectErrors.fileAlreadyExists),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(t.ok),
            ),
          ],
        ),
      ).ignore();

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
    log("Opening ${yamlFilePath}", name: "${ProjectsDrawer}");

    try {
      final yaml = YamlMagic.load(yamlFilePath);

      // TODO: create project folder, then load docker-compose.yml
    } on YamlException catch (ex, st) {
      final message = <String>[
        t.openProjectErrors.unknownFailureWhileOpeningFile(
          details: ex.message,
        ),
      ];

      if (ex.span != null) {
        final lines = await File(yamlFilePath).readAsLines();

        message.add("On line ${ex.span!.start.line}:\n");

        for (var l = 0; l < lines.length; l++) {
          if (l >= ex.span!.start.line && l <= ex.span!.end.line) {
            if (l > 0) {
              message.add("${l}:${lines[l - 1]}");
            }

            message.add("${l + 1}:${lines[l]}");

            if (l < lines.length - 1) {
              message.add("${l + 2}:${lines[l + 1]}");
            }
          }
        }
      }

      _showErrorDialog(
        context: context,
        exception: ex,
        stackTrace: st,
        logMessage: "Unknown failure while opening ${yamlFilePath}",
        dialogMessage: message.join("\n"),
        yamlFilePath: yamlFilePath,
      );
    } catch (ex, st) {
      _showErrorDialog(
        context: context,
        exception: ex,
        stackTrace: st,
        logMessage: "Unknown failure while opening ${yamlFilePath}",
        dialogMessage: t.openProjectErrors.unknownFailureWhileOpeningFile(
          details: ex.runtimeType,
        ),
        yamlFilePath: yamlFilePath,
      );
    }
  }

  static void _showErrorDialog({
    required BuildContext context,
    required Object exception,
    required StackTrace stackTrace,
    required String yamlFilePath,
    required String logMessage,
    required String dialogMessage,
  }) {
    log(
      "Failure to open ${yamlFilePath}",
      error: exception,
      stackTrace: stackTrace,
      name: "${ProjectsDrawer}",
    );

    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(t.oops),
        content: Text(dialogMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(t.ok),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
        ],
      ),
    );
  }
}
