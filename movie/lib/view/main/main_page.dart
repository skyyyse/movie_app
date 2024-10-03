import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:movie/controller/main_controller.dart';

class main_page extends StatefulWidget {
  main_page({super.key});

  @override
  State<main_page> createState() => _main_pageState();
}

class _main_pageState extends State<main_page> {
  final main=Get.put(main_controller());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: main.Page[main.index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: main.index,
        onTap: (value) {
          setState(() {
            main.index=value;
          });
        },
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.red,
        backgroundColor: Color(0xff11202C),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.category_outlined),label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border),label: "Favorites"),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Settings"),
        ],
      ),
    );
  }
}
