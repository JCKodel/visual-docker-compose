import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:path/path.dart' as Path;

class ProjectsDrawer extends StatelessWidget {
  const ProjectsDrawer({required this.roundCorners, super.key});

  final bool roundCorners;

  static Future<void> _createNewProject(BuildContext context) async {
    final loc = AppLocalizations.of(context)!;

    final path = await FilePicker.platform.getDirectoryPath(
      dialogTitle: loc.createNewProject,
    );

    if (path == null || context.mounted == false) {
      return;
    }

    final existingFile = File(Path.join(path, "docker-compose.yml"));

    if (existingFile.existsSync()) {
      showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(loc.createNewProject),
          content: Text(loc.fileAlreadyExists),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(loc.ok),
            ),
          ],
        ),
      ).ignore();

      return;
    }

    await _openDockerComposeFile(context, path, "docker-compose.yml");
  }

  static Future<void> _openExistingProject(BuildContext context) async {
    final loc = AppLocalizations.of(context)!;

    final pickedFile = await FilePicker.platform.pickFiles(
      dialogTitle: loc.openExistingProject,
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
    final loc = AppLocalizations.of(context)!;

    return Drawer(
      width: roundCorners ? null : 300,
      shape: roundCorners ? null : const Border(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            title: Text(loc.projects),
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
