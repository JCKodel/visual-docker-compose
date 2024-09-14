import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:system_theme/system_theme.dart';

import 'features/data/shared_preferences_storage.dart';
import 'features/home/home_view.dart';
import 'features/log/log.dart';
import 'features/project_management/projects_service.dart';
import 'features/storage/i_storage.dart';
import 'features/window_management/native_window_service.dart';
import 'gen/strings.g.dart';

Future<void> main() async {
  logInfo("Bootstrapping");

  WidgetsFlutterBinding.ensureInitialized();

  GetIt.I.registerSingletonAsync(
    SharedPreferencesStorage.factory,
  );

  GetIt.I.registerSingletonAsync(
    ProjectsService.factory,
    dependsOn: [IStorage],
  );

  GetIt.I.registerSingletonAsync(
    NativeWindowService.factory,
    dependsOn: [IStorage],
  );

  await GetIt.I.allReady();

  LocaleSettings.useDeviceLocale();

  runApp(TranslationProvider(child: const MainApp()));
}

final class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SystemTheme.accentColor.load(),
      builder: _systemThemeBuilder,
    );
  }

  static ThemeData _createThemeFrom({required ColorScheme colorScheme}) {
    return ThemeData.from(colorScheme: colorScheme).copyWith(
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: colorScheme.primary,
        ),
      ),
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
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      theme: _createThemeFrom(colorScheme: lightColorScheme),
      darkTheme: _createThemeFrom(colorScheme: darkColorScheme),
      themeMode: ThemeMode.system,
      home: const HomeView(),
    );
  }
}
