import 'package:business_essential/Home/optioned.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Aesthetics by Meherun"),
          elevation: 4,
          backgroundColor: const Color.fromARGB(255, 230, 230, 250),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.logout_outlined),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10, top: Get.height * .03),
                  height: Get.height,
                  width: Get.width,
                  color: const Color.fromARGB(255, 230, 230, 250),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                          radius: Get.height * .05,
                          backgroundImage:
                              const AssetImage("assets/profile.jpg")),
                      SizedBox(width: Get.width * .1),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("Mehurun Sristy", style: TextStyle(fontSize: 12))
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                    top: Get.height * .15,
                    child: Container(
                      padding: EdgeInsets.only(
                          top: Get.height * .04,
                          left: Get.width * .05,
                          right: Get.width * .05),
                      height: Get.height * .3,
                      width: Get.width,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 125, 119, 210),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20))),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: Get.height * .12,
                            width: Get.width * .4,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 143, 138, 202),
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 146, 140, 208),
                                    offset: Offset(4.0, 4.0),
                                    blurRadius: 15,
                                    spreadRadius: 1.0,
                                  ),
                                  BoxShadow(
                                    color: Color.fromARGB(255, 103, 98, 145),
                                    offset: Offset(-4.0, -4.0),
                                    blurRadius: 15,
                                    spreadRadius: 1.0,
                                  )
                                ]),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("1200" + " " + "BDT",
                                    style: TextStyle(fontSize: 22)),
                                Text("Main Balance",
                                    style: TextStyle(fontSize: 10))
                              ],
                            ),
                          ),
                          SizedBox(width: Get.width * .06),
                          Container(
                            height: Get.height * .12,
                            width: Get.width * .4,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 143, 138, 202),
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 146, 140, 208),
                                    offset: Offset(4.0, 4.0),
                                    blurRadius: 15,
                                    spreadRadius: 1.0,
                                  ),
                                  BoxShadow(
                                    color: Color.fromARGB(255, 103, 98, 145),
                                    offset: Offset(-4.0, -4.0),
                                    blurRadius: 15,
                                    spreadRadius: 1.0,
                                  )
                                ]),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("10", style: TextStyle(fontSize: 22)),
                                Text("Completed",
                                    style: TextStyle(fontSize: 10))
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
                Positioned(
                    top: Get.height * .35,
                    child: Container(
                      width: Get.width,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 230, 230, 250),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20))),
                      child: option_widget(),
                    ))
              ],
            ),
          ),
        ));
  }
}
