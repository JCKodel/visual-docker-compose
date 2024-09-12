part of 'home.dart';

final class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              Theme.of(context).colorScheme.primary.value.toRadixString(16),
            ),
            Switch(value: true, onChanged: (_) {}),
          ],
        ),
      ),
    );
  }
}
