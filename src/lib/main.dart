import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:system_theme/system_theme.dart';

import 'features/home.dart';
import 'features/window_manager.dart';

part 'main.main_app.dart';

Future<void> main() async {
  await NativeWindowService.instance.initialize();
  runApp(const MainApp());
}
