import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hugeicons/hugeicons.dart';

class ProjectsDrawer extends StatelessWidget {
  const ProjectsDrawer({required this.roundCorners, super.key});

  final bool roundCorners;

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
                onPressed: () {},
                icon: const Icon(HugeIcons.strokeRoundedAddCircle),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
