import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pendingcontroller extends GetxController {
  productDelete(dynamic doc) {
    FirebaseFirestore.instance.collection("Pending product").doc(doc).delete();
  }
}
