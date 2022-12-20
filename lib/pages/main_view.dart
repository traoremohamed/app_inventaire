import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core.dart';
import 'main_controller.dart';

class MainView extends GetView<MainController> {

  MainController mCont = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Obx(()=> Text("${mCont.currentUsers.value.name}", style: TextStyle(color: Colors.black),)),
      ),*/
      body: PageView(
        controller: controller.pageCotroller,
        physics: NeverScrollableScrollPhysics(),
        children: [
          //HomeView(),
          /*SearchView(),*/
         // NotificationView(),
         // ProfileView()
        ],
      ),
      bottomNavigationBar: ValueBuilder<int>(
        initialValue: 0,
        builder: (value, updateFn) => Container(
          color: Colors.grey[200],
        ),
      ),
    );
  }
}