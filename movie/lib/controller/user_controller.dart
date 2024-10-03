import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:movie/controller/shared_controller.dart';
import 'package:movie/constanst/server.dart';
import '../model/user_model.dart';
import 'auth_controller.dart';
class user_controller extends GetxController{
  final prefsController = Get.put(shared_controller());
  final auth=Get.put(auth_controller());
  final name=TextEditingController();
  final email=TextEditingController();
  final phone=TextEditingController();
  final address=TextEditingController();
  var isloading = false.obs;
  var Users=<user_model>[].obs;
  @override
  void onInit() {
    get();
    super.onInit();
  }
  void get()async{
    try{
      isloading.value=true;
      final response = await http.get(Uri.parse(service.user),
        headers: {
          "Authorization": "Bearer ${prefsController.token}",
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        isloading.value=false;
        final List<dynamic> userlist=jsonDecode(response.body)['user'];
        Users.assignAll(userlist.map((json) => user_model.fromjson(json)).toList());
      } else {
        Get.snackbar('Error', 'Failed to fetch Slider');
      }
    }catch(e){
      print(e);
    }
  }

  void changes_profile(File? image,String nametxt,String emailtxt,String phonetxt,String addresstxt)async{
    try{
      var headers = {
        "Authorization": "Bearer ${prefsController.token}",
      };
      var request = http.MultipartRequest('POST', Uri.parse('http://10.0.2.2:8000/api/user/profile'));
      request.fields.addAll({
        'name': name.text.isEmpty?nametxt:name.text,
        'email': email.text.isEmpty?emailtxt: email.text,
        'phone': phone.text.isEmpty?phonetxt:phone.text,
        'address': address.text.isEmpty?addresstxt:address.text,
      });
      image?.path==null?null:request.files.add(await http.MultipartFile.fromPath('image', image!.path));
      request.headers.addAll(headers);
      clear();
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        Get.snackbar('Sucess', 'Create  posts sucessfull..');
        get();
      }
      else {
        print(response.reasonPhrase);
      }
    }catch(data){
      print(data);
    }
  }
  void clear() {
    name.text = '';
    email.text = '';
    phone.text = '';
    address.text = '';
  }
  void logout() {
    Get.defaultDialog(
      title: '',
      content:  const Text("You can customize it as needed."),
      confirm: TextButton(
        onPressed: () {
          auth.logout();
        },
        child: const Text("Confirm",style: TextStyle(color: Colors.red),),
      ),
      cancel: TextButton(
        onPressed: () {
          Get.back();
        },
        child: const Text("Cancel",style: (TextStyle(color: Colors.blueAccent)),),
      ),
    );
  }
}