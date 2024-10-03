import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class shared_controller extends GetxController {
  late SharedPreferences Preferences;

  Future<shared_controller> init() async {
    Preferences = await SharedPreferences.getInstance();
    return this;
  }

  String get token {
    return Preferences.getString('token') ?? '';
  }

  Future<void> setToken(String token) async {
    await Preferences.setString('token', token);
  }

  bool get isLoggedIn {
    return token.isNotEmpty;
  }
  Future<void> clearToken() async {
    await Preferences.remove('token');
  }
}
