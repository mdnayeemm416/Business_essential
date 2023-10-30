import 'package:business_essential/firebaseFunction/FirebaseFunction.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Delevered extends StatefulWidget {
  const Delevered({super.key});

  @override
  State<Delevered> createState() => _DeleveredState();
}

class _DeleveredState extends State<Delevered> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Item Place for Delivered")),
        elevation: 4,
      ),
      body: Column(children: [
        Expanded(
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("Delivered")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  final doc = snapshot.data!.docs;
                  return ListView.builder(
                      itemCount: doc.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.only(
                              top: 10, right: 15, left: 15, bottom: 10),
                          margin: const EdgeInsets.only(
                              top: 15, left: 15, right: 15),
                          height: 120,
                          width: Get.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(255, 237, 237, 239),
                                  offset: Offset(4.0, 4.0),
                                  blurRadius: 15,
                                  spreadRadius: 1.0,
                                ),
                                BoxShadow(
                                  color: Color.fromARGB(255, 234, 234, 236),
                                  offset: Offset(-4.0, -4.0),
                                  blurRadius: 15,
                                  spreadRadius: 1.0,
                                )
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(doc[index]["name"]),
                                  Expanded(
                                      child: Container(
                                          width: Get.width * .6,
                                          child: Text(doc[index]["Address"]))),
                                  Text(doc[index]["price"] + " " + "BDT")
                                ],
                              ),
                              Column(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Get.defaultDialog(
                                          titlePadding:
                                              const EdgeInsets.only(top: 20),
                                          title: "Are You Sure",
                                          middleText:
                                              "Product Delivered Completed",
                                          titleStyle: const TextStyle(
                                              color: Colors.green),
                                          cancel: Container(
                                            padding: const EdgeInsets.only(
                                                right: 20),
                                            child: GestureDetector(
                                                onTap: () {
                                                  Get.back();
                                                },
                                                child: const Text(
                                                  'No',
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                )),
                                          ),
                                          confirm: Container(
                                            padding:
                                                const EdgeInsets.only(left: 20),
                                            child: GestureDetector(
                                                onTap: () {
                                                  moveto(
                                                      doc[index]["name"],
                                                      doc[index]["Address"],
                                                      doc[index]["price"],
                                                      "Complete");
                                                  Delete(doc[index].id,
                                                      "Delivered");
                                                  Get.back();
                                                },
                                                child: const Text(
                                                  'Yes',
                                                  style: TextStyle(
                                                      color: Colors.green),
                                                )),
                                          ),
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.done_outline,
                                        color: Colors.green,
                                      )),
                                  IconButton(
                                      onPressed: () {
                                        Get.defaultDialog(
                                          titlePadding:
                                              const EdgeInsets.only(top: 20),
                                          title: "Delete",
                                          middleText:
                                              "Want to Delete the Product",
                                          titleStyle: const TextStyle(
                                              color: Colors.red),
                                          cancel: Container(
                                            padding: const EdgeInsets.only(
                                                right: 20),
                                            child: GestureDetector(
                                                onTap: () {
                                                  Get.back();
                                                },
                                                child: const Text(
                                                  'No',
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                )),
                                          ),
                                          confirm: Container(
                                            padding:
                                                const EdgeInsets.only(left: 20),
                                            child: GestureDetector(
                                                onTap: () {
                                                  Delete(doc[index].id,
                                                      "Delivered");
                                                  Get.back();
                                                },
                                                child: const Text(
                                                  'Yes',
                                                  style: TextStyle(
                                                      color: Colors.green),
                                                )),
                                          ),
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.delete_forever,
                                        color: Colors.red,
                                      )),
                                ],
                              )
                            ],
                          ),
                        );
                      });
                }
              }),
        )
      ]),
    );
  }
}
