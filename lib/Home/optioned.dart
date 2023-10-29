import 'package:business_essential/Home/AddItem.dart';
import 'package:business_essential/Home/pending.dart';
import 'package:business_essential/widget/box_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class option_widget extends StatelessWidget {
  const option_widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              InkWell(
                  onTap: () {
                    Get.to(Pending_item());
                  },
                  child: Box_widget(
                      img: "assets/completed.png", text: "Completed")),
              SizedBox(
                width: Get.width * .03,
              ),
              InkWell(
                  onTap: () {
                    Get.to(AddItem());
                  },
                  child: Box_widget(
                      img: "assets/delivery.png", text: "Delivered")),
            ],
          ),
          SizedBox(
            height: Get.height * .02,
          ),
          Row(
            children: [
              InkWell(
                  onTap: () {
                    Get.to(Pending_item());
                  },
                  child:
                      Box_widget(img: "assets/pending.png", text: "pending")),
              SizedBox(
                width: Get.width * .03,
              ),
              InkWell(
                  onTap: () {
                    Get.to(AddItem());
                  },
                  child: Box_widget(img: "assets/Add.png", text: "Add")),
            ],
          )
        ],
      ),
    );
  }
}
