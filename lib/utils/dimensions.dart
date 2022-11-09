import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dimensions {
  //colors
  static const backGroundColor = Color(0xFF202020);
  static const kPrimaryColor = Color(0xFFFFBD73);
  static const greyColor = Color(0xFFbab6b6);
  static const whiteColor = Color(0xFFFFFFFF);
  static const deepGreyColor = Color(0xFF665151);
  static const lightBlackColor = Color(0xFF423737);
  static const blackColor = Color(0xFF000000);
  static const redColor = Color(0xFFFF3333);
  static final greenOpacityColor = Colors.green.withOpacity(0.5);

  //dimensions
  static double SCREEN_HEIGHT = Get.context!.height; //805.3333333333334
  static double SCREEN_WIDTH = Get.context!.width; //384.0

  //heights
  static double height2 = SCREEN_HEIGHT / (SCREEN_HEIGHT / 2);
  static double height5 = SCREEN_HEIGHT / (SCREEN_HEIGHT / 5);
  static double height10 = SCREEN_HEIGHT / (SCREEN_HEIGHT / 10);
  static double height15 = SCREEN_HEIGHT / (SCREEN_HEIGHT / 15);
  static double height20 = SCREEN_HEIGHT / (SCREEN_HEIGHT / 20);
  static double height25 = SCREEN_HEIGHT / (SCREEN_HEIGHT / 25);
  static double height30 = SCREEN_HEIGHT / (SCREEN_HEIGHT / 30);
  static double height40 = SCREEN_HEIGHT / (SCREEN_HEIGHT / 40);
  static double height50 = SCREEN_HEIGHT / (SCREEN_HEIGHT / 50);
  static double height60 = SCREEN_HEIGHT / (SCREEN_HEIGHT / 60);
  static double height80 = SCREEN_HEIGHT / (SCREEN_HEIGHT / 80);
  static double height100 = SCREEN_HEIGHT / (SCREEN_HEIGHT / 100);
  static double height150 = SCREEN_HEIGHT / (SCREEN_HEIGHT / 150);

//widths
  static double width2 = SCREEN_WIDTH / (SCREEN_WIDTH / 2);
  static double width5 = SCREEN_WIDTH / (SCREEN_WIDTH / 5);
  static double width10 = SCREEN_WIDTH / (SCREEN_WIDTH / 10);
  static double width15 = SCREEN_WIDTH / (SCREEN_WIDTH / 15);
  static double width20 = SCREEN_WIDTH / (SCREEN_WIDTH / 20);
  static double width25 = SCREEN_WIDTH / (SCREEN_WIDTH / 25);
  static double width30 = SCREEN_WIDTH / (SCREEN_WIDTH / 30);
  static double width40 = SCREEN_WIDTH / (SCREEN_WIDTH / 40);
  static double width50 = SCREEN_WIDTH / (SCREEN_WIDTH / 50);
}
