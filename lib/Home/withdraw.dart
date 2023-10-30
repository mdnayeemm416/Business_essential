import 'package:business_essential/Home/withdrawForm.dart';
import 'package:business_essential/getx_function/getxcontroller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class withdraw extends StatefulWidget {
  const withdraw({super.key});

  @override
  State<withdraw> createState() => _withdrawState();
}

class _withdrawState extends State<withdraw> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(const Addwithdraw());
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("Withdraw"),
      ),
      body: Column(children: [
        Expanded(
          child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection("withdraw").snapshots(),
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
                                  Text(
                                    doc[index]["reason"],
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(doc[index]["amount"] + " " + "BDT")
                                ],
                              ),
                              Image.asset(
                                "assets/withdraw.png",
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
