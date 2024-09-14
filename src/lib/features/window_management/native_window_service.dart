import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:window_manager/window_manager.dart';

import '../log/log.dart';
import '../storage/i_storage.dart';
import 'native_window_state.dart';

final class NativeWindowService with WindowListener implements Disposable {
  const NativeWindowService._({required IStorage storage}) : _storage = storage;

  final IStorage _storage;

  static const _windowTitle = "Visual Docker Compose";

  static Future<NativeWindowService> factory() async {
    logInfo("Initialing");

    final instance = NativeWindowService._(storage: GetIt.I<IStorage>());

    await instance._initializeAsync();

    return instance;
  }

  Future<void> _initializeAsync() async {
    final windowStateJson = _storage.getString("windowState");
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

  @override
  void onDispose() {
    windowManager.removeListener(this);
  }

  static Future<void> _initializeNewWindow(WidgetsBinding binding) async {
    const windowOptions = WindowOptions(
      size: Size(1280 * 0.75, 720 * 0.75),
      center: true,
      backgroundColor: Color(0x00000000),
      title: _windowTitle,
    );

    await windowManager.waitUntilReadyToShow(
      windowOptions,
      _finishWindowInitialization,
    );
  }

  static Future<void> _initializeExistingWindow(String windowStateJson) async {
    final windowState = NativeWindowState.fromJson(windowStateJson);

    final windowOptions = WindowOptions(
      size: windowState.bounds.size,
      backgroundColor: const Color(0x00000000),
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

    final windowStateJson = _storage.getString("windowState");

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

    logInfo("Saving ${newWindowStateJson}");

    await _storage.setString("windowState", newWindowStateJson);
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
    switch (defaultTargetPlatform) {
      case TargetPlatform.windows || TargetPlatform.macOS:
        return;
      default:
        _saveWindowState();
    }
  }

  @override
  void onWindowResized() {
    _saveWindowState();
  }

  @override
  void onWindowMove() {
    switch (defaultTargetPlatform) {
      case TargetPlatform.windows || TargetPlatform.macOS:
        return;
      default:
        _saveWindowState();
    }
  }

  @override
  void onWindowMoved() {
    _saveWindowState();
  }
}
