import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:movie/constanst/colors.dart';
import 'package:movie/controller/shared_controller.dart';
import 'package:movie/view/main/main_page.dart';

import '../view/auth/login_page.dart';

class auth_controller extends GetxController {
  final Preferences = Get.put(shared_controller());
  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirm = TextEditingController();
  var loading = true.obs;
  void login_server() async {
    try {
      loading.value = true;
      final response = await http.post(
        Uri.parse('http://10.0.2.2:8000/api/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email.text,
          'password': password.text,
        }),
      );
      if (response.statusCode == 200) {
        loading.value = false;
        final data = jsonDecode(response.body);
        if (data['status'] == true) {
          await Preferences.setToken(data['token']);
          return Get.offAll(main_page());
        } else {
          print(data['message']);
        }
      }
    } catch (data) {
      print(data);
    }
  }
  void logout() async {
    try {
      loading.value = true;
      var headers = {
        "Authorization": "Bearer ${Preferences.token}",
      };
      var request = http.Request('POST', Uri.parse('http://10.0.2.2:8000/api/user/logout'));
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        loading.value = false;
        Preferences.clearToken();
        return Get.offAll(login());
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e);
    }
  }
}
