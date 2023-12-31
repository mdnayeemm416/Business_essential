import 'package:business_essential/getx_function/getxcontroller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Completed extends StatefulWidget {
  const Completed({super.key});

  @override
  State<Completed> createState() => _CompletedState();
}

class _CompletedState extends State<Completed> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Completed Item")),
        elevation: 4,
      ),
      body: Column(children: [
        Expanded(
          child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection("Complete").snapshots(),
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
                              Image.network(
                                "https://cdn4.iconfinder.com/data/icons/basicolor-arrows-checks/24/ok_check_done-512.png",
                                height: 50,
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
