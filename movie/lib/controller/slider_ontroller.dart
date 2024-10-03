import 'dart:convert';
import 'package:get/get.dart';
import 'package:movie/controller/shared_controller.dart';
import 'package:movie/model/slider_model.dart';
import 'package:http/http.dart' as http;
import 'package:movie/constanst/server.dart';

class slider_controller extends GetxController {
  final Preferences = Get.put(shared_controller());
  var Slider = <slider_model>[].obs;
  var loading = true.obs;
  var currentIndex = 0;
  void get() async {
    try {
      loading.value=true;
      final respnonce = await http.get(Uri.parse(service.slider), headers: {
        "Authorization": "Bearer ${Preferences.token}",
        'Content-Type': 'application/json',
      });
      if(respnonce.statusCode==200){
        loading.value=false;
        final List<dynamic> slider_list=jsonDecode(respnonce.body)['slider'];
        Slider.assignAll(slider_list.map((json) => slider_model.fromjson(json)).toList());
      }
    } catch (error) {
      print(error);
    }
  }
}
