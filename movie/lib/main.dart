import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:movie/controller/shared_controller.dart';
import 'package:movie/view/auth/login_page.dart';
import 'package:movie/view/main/main_page.dart';
//
// void main() {
//   runApp(const movie_app());
// }
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // MediaKit.ensureInitialized();
  final prefsController = Get.put(shared_controller());
  await prefsController.init();
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => movie_app(),
    ),
  );
  // runApp(const ecommerce());
}
class movie_app extends StatelessWidget {
  movie_app({super.key});
  final prefsController = Get.put(shared_controller());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: prefsController.isLoggedIn?main_page():login(),
    );
  }
}
