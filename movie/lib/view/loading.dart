import 'package:flutter/material.dart';
class isloading extends StatelessWidget {
  const isloading({super.key});
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(
          color: Colors.transparent,
          width: 20,
          height: 20,
          child: CircularProgressIndicator()
      ),
    );
  }
}
