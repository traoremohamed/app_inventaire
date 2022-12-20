import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core.dart';

class MainController extends GetxController {



  final pageCotroller = PageController();
  final animationDuration = const Duration(milliseconds: 350);


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {

    super.onReady();
  }

  @override
  void onClose() {
    pageCotroller.dispose();

    debugPrint("[ MainController ] => onClose()");
    super.onClose();
  }
}