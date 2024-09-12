import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:window_manager/window_manager.dart';

import 'native_window_state.dart';

final class NativeWindowService with WindowListener {
  const NativeWindowService._();

  static NativeWindowService? _instance;

  static NativeWindowService get instance =>
      _instance ??= const NativeWindowService._();

  static late final SharedPreferences _sharedPreferences;
  static const _windowTitle = "Visual Docker Compose";

  Future<void> initialize() async {
    log("Initializing", name: "${NativeWindowService}");

    _sharedPreferences = await SharedPreferences.getInstance();

    final windowStateJson = _sharedPreferences.getString("windowState");
    final binding = WidgetsFlutterBinding.ensureInitialized();

    await windowManager.ensureInitialized();

    if (windowStateJson == null) {
      await _initializeNewWindow(binding);
    } else {
      try {
        await _initializeExistingWindow(windowStateJson);
      } on FormatException catch (ex, st) {
        log(
          "Error while deserializing window state from ${windowStateJson}",
          error: ex,
          stackTrace: st,
        );

        await _initializeNewWindow(binding);
      }
    }

    windowManager.addListener(this);
  }

  static Future<void> _initializeNewWindow(WidgetsBinding binding) async {
    log("Initializing new window", name: "${NativeWindowService}");

    const windowOptions = WindowOptions(
      size: Size(1280 * 0.75, 720 * 0.75),
      center: true,
      backgroundColor: Colors.transparent,
      title: _windowTitle,
    );

    await windowManager.waitUntilReadyToShow(
      windowOptions,
      _finishWindowInitialization,
    );
  }

  static Future<void> _initializeExistingWindow(String windowStateJson) async {
    log(
      "Initializing window as ${windowStateJson}",
      name: "${NativeWindowService}",
    );

    final windowState = NativeWindowState.fromJson(windowStateJson);

    final windowOptions = WindowOptions(
      size: windowState.bounds.size,
      backgroundColor: Colors.transparent,
      title: _windowTitle,
    );

    await windowManager.waitUntilReadyToShow(
      windowOptions,
      () async {
        await windowManager.setSize(windowState.bounds.size);
        await windowManager.setPosition(windowState.bounds.topLeft);

        if (windowState.isMaximized) {
          await windowManager.maximize();
        }

        await _finishWindowInitialization();
      },
    );
  }

  static Future<void> _finishWindowInitialization() async {
    await windowManager.show();
    await windowManager.focus();
    await windowManager.setMinimumSize(const Size(375, 375));
  }

  Future<void> _saveWindowState() async {
    await Future<void>.delayed(const Duration(milliseconds: 100));

    final [Rect windowBounds, bool isMaximized] = await Future.wait<dynamic>(
      [
        windowManager.getBounds(),
        windowManager.isMaximized(),
      ],
    );

    final windowStateJson = _sharedPreferences.getString("windowState");

    final windowState = windowStateJson == null
        ? NativeWindowState(
            bounds: windowBounds,
            isMaximized: isMaximized,
          )
        : NativeWindowState.fromJson(windowStateJson);

    final newWindowStateJson = isMaximized
        ? windowState.copyWith(isMaximized: true).toJson()
        : windowState
            .copyWith(
              bounds: windowBounds,
              isMaximized: false,
            )
            .toJson();

    log(
      "Saving window state: ${newWindowStateJson}",
      name: "${NativeWindowService}",
    );

    await _sharedPreferences.setString("windowState", newWindowStateJson);
  }

  @override
  void onWindowMaximize() {
    _saveWindowState();
  }

  @override
  void onWindowUnmaximize() {
    _saveWindowState();
  }

  @override
  void onWindowResize() {
    if (Platform.isWindows || Platform.isMacOS) {
      return;
    }

    _saveWindowState();
  }

  @override
  void onWindowResized() {
    _saveWindowState();
  }

  @override
  void onWindowMove() {
    if (Platform.isWindows || Platform.isMacOS) {
      return;
    }

    _saveWindowState();
  }

  @override
  void onWindowMoved() {
    _saveWindowState();
  }
}
