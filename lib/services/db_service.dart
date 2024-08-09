import 'package:shared_preferences/shared_preferences.dart';

class DatabaseService {
  DatabaseService();
  Future<bool> saveList(String key, String value) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      bool result = await prefs.setString(key, value);
      return result;
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    return false;
  }

  Future<String?> getList(String key) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? result = prefs.getString(key);
      return result;
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    return null;
  }
}
