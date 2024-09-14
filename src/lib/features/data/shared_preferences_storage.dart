import 'package:shared_preferences/shared_preferences.dart';

import '../log/log.dart';
import '../storage/i_storage.dart';

final class SharedPreferencesStorage implements IStorage {
  const SharedPreferencesStorage._(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  static Future<IStorage> factory() async {
    logInfo("Initializing");

    final sharedPreferences = await SharedPreferences.getInstance();

    return SharedPreferencesStorage._(sharedPreferences);
  }

  @override
  Set<String> getKeys() => _sharedPreferences.getKeys();

  @override
  Object? get(String key) => _sharedPreferences.get(key);

  @override
  bool? getBool(String key) => _sharedPreferences.getBool(key);

  @override
  int? getInt(String key) => _sharedPreferences.getInt(key);

  @override
  double? getDouble(String key) => _sharedPreferences.getDouble(key);

  @override
  String? getString(String key) => _sharedPreferences.getString(key);

  @override
  bool containsKey(String key) => _sharedPreferences.containsKey(key);

  @override
  List<String>? getStringList(String key) =>
      _sharedPreferences.getStringList(key);

  @override
  Future<bool> setBool(String key, bool value) async {
    logInfo("${key} = ${value}");

    return _sharedPreferences.setBool(key, value);
  }

  @override
  Future<bool> setInt(String key, int value) async {
    logInfo("${key} = ${value}");

    return _sharedPreferences.setInt(key, value);
  }

  @override
  Future<bool> setDouble(String key, double value) async {
    logInfo("${key} = ${value}");

    return _sharedPreferences.setDouble(key, value);
  }

  @override
  Future<bool> setString(String key, String value) async {
    logInfo("${key} = ${value}");

    return _sharedPreferences.setString(key, value);
  }

  @override
  Future<bool> setStringList(String key, List<String> value) async {
    logInfo("${key} = ${value}");

    return _sharedPreferences.setStringList(key, value);
  }

  @override
  Future<bool> remove(String key) => _sharedPreferences.remove(key);

  @override
  Future<void> clear() => _sharedPreferences.clear();
}
