import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Addwithdraw extends StatefulWidget {
  const Addwithdraw({super.key});

  @override
  State<Addwithdraw> createState() => _AddwithdrawState();
}

class _AddwithdrawState extends State<Addwithdraw> {
  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController pricecontroller = TextEditingController();

  Addtask() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    String time = DateTime.now().toString();
    FirebaseFirestore.instance
        .collection("withdraw")
        .doc(time)
        .set({"reason": titlecontroller.text, "amount": pricecontroller.text});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Withdraw Amount")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              height: double.maxFinite,
              width: MediaQuery.of(context).size.width,
              child: Column(children: [
                TextField(
                  controller: titlecontroller,
                  cursorColor: const Color.fromARGB(255, 230, 230, 250),
                  decoration: InputDecoration(
                      label: const Text("Withdraw Reason"),
                      labelStyle: const TextStyle(color: Colors.black),
                      hintText: "Withdraw Reason",
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
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: pricecontroller,
                  cursorColor: const Color.fromARGB(255, 230, 230, 250),
                  decoration: InputDecoration(
                      label: const Text("Amount"),
                      labelStyle: const TextStyle(color: Colors.black),
                      hintText: "Amount",
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
                const SizedBox(
                  height: 20,
                ),
                Container(
                    height: 50,
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: () {
                        Addtask();
                        Get.snackbar("Successful", "Withdraw Done");
                        Get.toNamed("/withdraw");
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
