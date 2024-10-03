import 'package:flutter/material.dart';

class movie extends StatelessWidget {
  const movie({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff11202C),
        elevation: 0,
        title: const Text(
          "Categories",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
