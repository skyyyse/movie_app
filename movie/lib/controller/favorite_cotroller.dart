import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie/constanst/server.dart';
import 'package:get/get.dart';
import 'package:movie/controller/movie_controller.dart';
import 'package:movie/controller/shared_controller.dart';
import 'package:movie/model/favorite_model.dart';

class favorite_cotroller extends GetxController{
  final Preferences = Get.put(shared_controller());
  final movie = Get.put(movie_controller());
  var Favorite = <favorite_model>[].obs;
  var loading = true.obs;
  var currentIndex = 0;
  void get() async {
    try {
      loading.value=true;
      final respnonce = await http.get(Uri.parse(service.favorite), headers: {
        "Authorization": "Bearer ${Preferences.token}",
        'Content-Type': 'application/json',
      });
      if(respnonce.statusCode==200){
        loading.value=false;
        print('object');
        final List<dynamic> favorite_list=jsonDecode(respnonce.body)['favorite'];
        Favorite.assignAll(favorite_list.map((json) => favorite_model.fromjson(json)).toList());
      }
    } catch (error) {
      print(error);
    }
  }
  void far_un(id)async{
    try {
      loading.value=true;
      final response = await http.get(
        Uri.parse(service.farvoriteunfavorite+"${id}"),
        headers: {
          "Authorization": "Bearer ${Preferences.token}",
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        loading.value=false;
        final data = json.decode(response.body);
        if (data['status'] == true) {
          Get.snackbar("Sucess","${data['message']}");
          get();
          movie.detail(id);
        }
      } else {
        Get.snackbar('Error', 'Failed to fetch posts');
      }
    } catch (error) {
      print(error);
    }
  }
}