part of 'main.dart';

final class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SystemTheme.accentColor.load(),
      builder: _systemThemeBuilder,
    );
  }

  Widget _systemThemeBuilder(
    BuildContext context,
    AsyncSnapshot<void> snapshot,
  ) {
    final accentColor = SystemTheme.accentColor.accent;

    final lightColorScheme = ColorScheme.fromSeed(
      seedColor: accentColor,
      brightness: Brightness.light,
    );

    final darkColorScheme = ColorScheme.fromSeed(
      seedColor: accentColor,
      brightness: Brightness.dark,
    );

    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData.from(colorScheme: lightColorScheme),
      darkTheme: ThemeData.from(colorScheme: darkColorScheme),
      themeMode: ThemeMode.system,
      home: const HomeView(),
    );
  }
}
