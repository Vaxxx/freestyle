import 'package:flutter/material.dart';
import 'package:freestyle/model/user.dart';
import 'package:freestyle/service/userservice.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  void login(User user) async {
    try {
      await UserService.loginUser(user);
      Get.snackbar("Login Status", "Congratulations login is successful!");
    } catch (e) {
      debugPrint("Error: $e");
      Get.snackbar("Login Status", "Sorry login is unsuccessful!");
    }
  }
}
