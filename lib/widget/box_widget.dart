// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Box_widget extends StatelessWidget {
  final String img;
  final String text;

  const Box_widget({
    Key? key,
    required this.img,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: 150,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 230, 230, 250),
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 220, 220, 227),
              offset: Offset(4.0, 4.0),
              blurRadius: 15,
              spreadRadius: 1.0,
            ),
            BoxShadow(
              color: Color.fromARGB(255, 221, 221, 225),
              offset: Offset(-4.0, -4.0),
              blurRadius: 15,
              spreadRadius: 1.0,
            )
          ]),
      child: Column(children: [
        Image.asset(
          img,
          height: Get.height * .12,
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: Get.height * .03, fontWeight: FontWeight.bold),
        )
      ]),
    );
  }
}
