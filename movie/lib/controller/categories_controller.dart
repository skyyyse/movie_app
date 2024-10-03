import 'dart:convert';

import 'package:get/get.dart';
import 'package:movie/controller/shared_controller.dart';
import 'package:movie/model/categories_model.dart';
import 'package:http/http.dart' as http;
import 'package:movie/constanst/server.dart';
final Preferences = Get.put(shared_controller());
class categories_controller extends GetxController{
  var Categories=<categories_model>[].obs;
  var loading=true.obs;
  void get() async {
    try {
      loading.value=true;
      final respnonce = await http.get(Uri.parse(service.categories), headers: {
        "Authorization": "Bearer ${Preferences.token}",
        'Content-Type': 'application/json',
      });
      if(respnonce.statusCode==200){
        loading.value=false;
        final List<dynamic> categories_list=jsonDecode(respnonce.body)['categories'];
        Categories.assignAll(categories_list.map((json) => categories_model.fromjson(json)).toList());
      }
    } catch (error) {
      print(error);
    }
  }
}