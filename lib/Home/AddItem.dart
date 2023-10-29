import 'package:business_essential/Home/dashboard.dart';
import 'package:business_essential/Home/pending.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController descriptioncontroller = TextEditingController();
  final TextEditingController pricecontroller = TextEditingController();

  Addtask() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    String time = DateTime.now().toString();
    FirebaseFirestore.instance.collection("Pending product").doc(time).set({
      "name": titlecontroller.text,
      "Address": descriptioncontroller.text,
      "price": pricecontroller.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Image.network(
                "https://cdn2.iconfinder.com/data/icons/hand-drawn-10/135/132-1024.png",
                height: Get.height * .3,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              height: double.maxFinite,
              width: MediaQuery.of(context).size.width,
              child: Column(children: [
                TextField(
                  controller: titlecontroller,
                  cursorColor: Color.fromARGB(255, 230, 230, 250),
                  decoration: InputDecoration(
                      label: Text("Customer Name"),
                      labelStyle: TextStyle(color: Colors.black),
                      hintText: "Customer Name",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: descriptioncontroller,
                  maxLines: 3,
                  cursorColor: Color.fromARGB(255, 230, 230, 250),
                  decoration: InputDecoration(
                      label: Text("Customer Address"),
                      labelStyle: TextStyle(color: Colors.black),
                      hintText: "Customer Address",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: pricecontroller,
                  cursorColor: Color.fromARGB(255, 230, 230, 250),
                  decoration: InputDecoration(
                      label: Text("Price"),
                      labelStyle: TextStyle(color: Colors.black),
                      hintText: "Price",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: 50,
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: () {
                        Addtask();
                        Get.snackbar("Successful", "Your product added");
                        Get.to(Dashboard());
                      },
                      child: Text("Add"),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        primary: Color.fromARGB(255, 230, 230, 250),
                      ),
                    ))
              ]),
            )
          ],
        ),
      ),
    );
  }
}
