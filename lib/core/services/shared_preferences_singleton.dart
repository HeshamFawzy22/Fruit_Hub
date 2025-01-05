import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences _instance;

  /// Initializes the shared preferences singleton with the result of
  /// [SharedPreferences.getInstance].
  ///
  /// This method must be called before any other methods of the class are
  /// used. It is safe to call this method multiple times as it will just
  /// return the same instance.
  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  static setBoolean (String key, bool value) => _instance.setBool(key, value);

  static bool getBoolean (String key) => _instance.getBool(key) ?? false;
}
