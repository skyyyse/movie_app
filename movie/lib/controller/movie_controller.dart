import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie/constanst/server.dart';
import 'package:get/get.dart';
import 'package:movie/controller/shared_controller.dart';
import 'package:movie/model/movie_model.dart';
import '../model/detail_model.dart';
class movie_controller extends GetxController{
  final Preferences = Get.put(shared_controller());
  var Movie = <movie_model>[].obs;
  var MovieDetail = <movie_detail>[].obs;
  var loading = true.obs;
  var currentIndex = 0;
  void get() async {
    try {
      loading.value=true;
      final respnonce = await http.get(Uri.parse(service.movie), headers: {
        "Authorization": "Bearer ${Preferences.token}",
        'Content-Type': 'application/json',
      });
      if(respnonce.statusCode==200){
        loading.value=false;
        print('object');
        final List<dynamic> movie_list=jsonDecode(respnonce.body)['movie'];
        Movie.assignAll(movie_list.map((json) => movie_model.fromjson(json)).toList());
      }
    } catch (error) {
      print(error);
    }
  }
  void movie_subcategories(id)async{
    try {
      loading.value=true;
      final respnonce = await http.get(Uri.parse(service.moviesubcategories+'${id}'), headers: {
        "Authorization": "Bearer ${Preferences.token}",
        'Content-Type': 'application/json',
      });
      if(respnonce.statusCode==200){
        loading.value=false;
        final List<dynamic> movie_list=jsonDecode(respnonce.body)['movie'];
        Movie.assignAll(movie_list.map((json) => movie_model.fromjson(json)).toList());
      }
    } catch (error) {
      print(error);
    }
  }
  void detail(id)async{
    try {
      loading.value=true;
      final respnonce = await http.get(Uri.parse(service.moviedetail+'${id}'), headers: {
        "Authorization": "Bearer ${Preferences.token}",
        'Content-Type': 'application/json',
      });
      if(respnonce.statusCode==200){
        loading.value=false;
        final List<dynamic> movie_list=jsonDecode(respnonce.body)['movie'];
        MovieDetail.assignAll(movie_list.map((json) => movie_detail.fromjson(json)).toList());
      }
    } catch (error) {
      print(error);
    }
  }
}