import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:system_theme/system_theme.dart';

import 'features/home/home_view.dart';
import 'features/window_management/native_window_service.dart';
import 'gen/strings.g.dart';

Future<void> main() async {
  await NativeWindowService.instance.initialize();
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
