import 'package:get/get.dart';
import 'package:movie/view/categories/categories.dart';
import 'package:movie/view/favorite/favorite.dart';
import 'package:movie/view/home/home.dart';
import 'package:movie/view/settinges/settinges.dart';
class main_controller extends GetxController{
  int index=0;
  List Page=[
    home(),
    categories(),
    favorite(),
    settings(),
  ];
}