import 'package:business_essential/getx_function/getxcontroller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pending_item extends StatefulWidget {
  const Pending_item({super.key});

  @override
  State<Pending_item> createState() => _Pending_itemState();
}

class _Pending_itemState extends State<Pending_item> {
  final Pendingcontroller pendingcontroller = Get.put(Pendingcontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Pending Item")),
        elevation: 4,
      ),
      body: Column(children: [
        Center(
            child: Image.asset(
          "assets/deliveryP.png",
          height: Get.height * .4,
          fit: BoxFit.cover,
        )),
        Expanded(
          child: Container(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("Pending product")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      final doc = snapshot.data!.docs;
                      return ListView.builder(
                          itemCount: doc.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.only(
                                  top: 10, right: 15, left: 15, bottom: 10),
                              margin:
                                  EdgeInsets.only(top: 15, left: 15, right: 15),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(doc[index]["name"]),
                                      Expanded(
                                          child: Container(
                                              width: Get.width * .6,
                                              child:
                                                  Text(doc[index]["Address"]))),
                                      Text(doc[index]["price"] + " " + "BDT")
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Get.defaultDialog(
                                              titlePadding:
                                                  EdgeInsets.only(top: 20),
                                              title: "Are You Sure",
                                              middleText:
                                                  "Product placed for delivered",
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
                                                    EdgeInsets.only(left: 20),
                                                child: GestureDetector(
                                                    onTap: () {
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
                                          icon: Icon(
                                            Icons.done_outline,
                                            color: Colors.green,
                                          )),
                                      IconButton(
                                          onPressed: () {
                                            pendingcontroller
                                                .productDelete(doc);
                                          },
                                          icon: Icon(
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
                  })),
        )
      ]),
    );
  }
}
