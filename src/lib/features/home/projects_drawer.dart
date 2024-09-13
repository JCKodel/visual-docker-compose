import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:path/path.dart' as Path;

import '../../gen/strings.g.dart';

class ProjectsDrawer extends StatelessWidget {
  const ProjectsDrawer({required this.roundCorners, super.key});

  final bool roundCorners;

  static Future<void> _createNewProject(BuildContext context) async {
    final path = await FilePicker.platform.getDirectoryPath(
      dialogTitle: t.createNewProject,
    );

    if (path == null || context.mounted == false) {
      return;
    }

    final existingFile = File(Path.join(path, "docker-compose.yml"));

    if (existingFile.existsSync()) {
      showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(t.createNewProject),
          content: Text(t.fileAlreadyExists),
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

    await _openDockerComposeFile(context, path, "docker-compose.yml");
  }

  static Future<void> _openExistingProject(BuildContext context) async {
    final pickedFile = await FilePicker.platform.pickFiles(
      dialogTitle: t.openExistingProject,
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
      Path.basename(pickedFile.xFiles.first.name),
    );
  }

  static Future<void> _openDockerComposeFile(
    BuildContext context,
    String path,
    String fileName,
  ) async {
    print("Opening ${fileName} from ${path}");
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
            title: Text(t.projects),
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
