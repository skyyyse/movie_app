import 'dart:convert';

import 'package:get/get.dart';
import 'package:movie/controller/shared_controller.dart';
import 'package:movie/model/categories_model.dart';
import 'package:http/http.dart' as http;
import 'package:movie/constanst/server.dart';
import 'package:movie/model/subcategories_model.dart';
final Preferences = Get.put(shared_controller());
class subcategories_controller extends GetxController{
  var Subcategories=<subcategories_model>[].obs;
  var loading=true.obs;
  void get(id) async {
    try {
      loading.value=true;
      final respnonce = await http.get(Uri.parse(service.subcategories+"/${id}"), headers: {
        "Authorization": "Bearer ${Preferences.token}",
        'Content-Type': 'application/json',
      });
      if(respnonce.statusCode==200){
        loading.value=false;
        final List<dynamic> Subcategories_list=jsonDecode(respnonce.body)['subcategories'];
        Subcategories.assignAll(Subcategories_list.map((json) => subcategories_model.fromjson(json)).toList());
        print(Subcategories_list);
        print('object');
      }else{
        print('111111111');
      }
    } catch (error) {
      print(error);
    }
  }
}