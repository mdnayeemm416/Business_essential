import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBalaceController extends GetxController {
  RxDouble MainBalanceAmount = 0.0.obs;
  RxDouble currentBalanceAmount = 0.0.obs;
    
  RxDouble balanceDifference = 0.0.obs;

  void AddMainBalanceTotal(double value) {
    MainBalanceAmount.value += value;
  }

  void resetmainBalance() {
    MainBalanceAmount.value = 0.0;
  }


  void AddcurrentBalanceTotal(double value) {
    currentBalanceAmount.value += value;
  }

  void resetcurrentBalance() {
    currentBalanceAmount.value = 0.0;
  }
  void updateDifference() {
    balanceDifference.value = MainBalanceAmount.value - currentBalanceAmount.value;
  }
}

