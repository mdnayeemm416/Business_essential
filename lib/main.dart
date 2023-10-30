import 'package:business_essential/Home/AddItem.dart';
import 'package:business_essential/Home/Delivered.dart';
import 'package:business_essential/Home/completed.dart';
import 'package:business_essential/Home/dashboard.dart';
import 'package:business_essential/Home/pending.dart';
import 'package:business_essential/Home/withdraw.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(name: "/", page: () => const Dashboard()),
        GetPage(name: "/addItem", page: () => const AddItem()),
        GetPage(name: "/pending", page: () => const Pending_item()),
        GetPage(name: "/delivered", page: () => const Delevered()),
        GetPage(name: "/complete", page: () => const Completed()),
        GetPage(name: "/withdraw", page: () => const withdraw())
      ],
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Dashboard(),
    );
  }
}
