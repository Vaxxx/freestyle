import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var pageIndex = 0.obs;
  var pageController = PageController().obs;

  @override
  void onInit() {
    super.onInit();
    pageController.value = PageController();
  }

  @override
  void onClose() {
    super.onClose();
    pageController.value.dispose();
  }
}
