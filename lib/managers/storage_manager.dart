

import 'package:shared_preferences/shared_preferences.dart';

class SecureStorageManager {
  SharedPreferences? prefs;

  static SecureStorageManager? _shared;

  SecureStorageManager._();

  static SecureStorageManager get shared =>
      _shared ??= SecureStorageManager._();

  Future<void> gePreferences() async {
    return await SharedPreferences.getInstance().then((value) {
      prefs = value;
    });
  }

  insert(String key, dynamic data) async {
    if (data is String) {
      await prefs?.setString(key, data);
    } else if (data is int) {
      await prefs?.setInt(key, data);
    } else if (data is double) {
      await prefs?.setDouble(key, data);
    } else if (data is List<String>) {
      await prefs?.setStringList(key, data.toList());
    } else if (data is bool) {
      await prefs?.setBool(key, data);
    }
  }



 

  String? getStringPre(String key)  =>
     prefs?.getString(key);
  

  int? getIntPre(String key) =>
     prefs?.getInt(key);
  

  double? getDoublePre(String key)=>
     prefs?.getDouble(key);
  

  List<String>? getListPre(String key)  =>
     prefs?.getStringList(key);
  

  bool? getBoolPre(String key)  =>
     prefs?.getBool(key);
  

  removeAll() async {
    prefs?.clear();
  }
}
