import 'package:shared_preferences/shared_preferences.dart';

class LocalStrage {
  late SharedPreferences sharedPreferences;

  Future<void> getInstance() async {
    final prefs = await SharedPreferences.getInstance();
    sharedPreferences = prefs;
  }

  Future<void> setInt({required String key, required int value}) async {
    await sharedPreferences.setInt(key, value);
  }

  Future<void> setBool({required String key, required bool value}) async {
    await sharedPreferences.setBool(key, value);
  }

  Future<void> setDouble({required String key, required double value}) async {
    await sharedPreferences.setDouble(key, value);
  }

  Future<void> setString({required String key, required String value}) async {
    await sharedPreferences.setString(key, value);
  }

  Future<void> setStringList(
      {required String key, required List<String> value}) async {
    await sharedPreferences.setStringList(key, value);
  }

  int? getInt({required String key}) {
    return sharedPreferences.getInt(key);

  }

  bool? getBool({required String key}) {
    return sharedPreferences.getBool(key);
  }

  double? getDouble({required String key}) {
    return sharedPreferences.getDouble(key);
  }

  String? getString({required String key}) {
    return sharedPreferences.getString(key);
  }

  List<String>? getStringList({required String key}) {
    return sharedPreferences.getStringList(key);
  }
  Future<void> remove({required String key}) async {
    await sharedPreferences.remove(key);
  }


}
