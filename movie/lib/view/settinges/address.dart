import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class address extends StatelessWidget {
  const address({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:  Text("My Address".tr),
        elevation: 0,
        centerTitle: true,
      ),
    );
  }
}
