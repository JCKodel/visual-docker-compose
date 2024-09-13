import 'package:flutter/material.dart';

import 'projects_drawer.dart';

final class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => switch (constraints.maxWidth) {
        < 600 => const _HomeSmallView(),
        < 840 => const _HomeMediumView(),
        _ => const _HomeLargeView(),
      },
    );
  }
}

final class _HomeSmallView extends StatelessWidget {
  const _HomeSmallView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Visual Docker Compose"),
      ),
      drawer: const ProjectsDrawer(
        roundCorners: true,
      ),
    );
  }
}

final class _HomeMediumView extends StatelessWidget {
  const _HomeMediumView();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const ProjectsDrawer(
          roundCorners: false,
        ),
        Expanded(
          child: Scaffold(
            appBar: AppBar(),
          ),
        ),
      ],
    );
  }
}

final class _HomeLargeView extends StatelessWidget {
  const _HomeLargeView();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const ProjectsDrawer(
          roundCorners: false,
        ),
        Expanded(
          child: Scaffold(
            appBar: AppBar(),
          ),
        ),
      ],
    );
  }
}
