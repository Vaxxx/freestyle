import 'package:flutter/material.dart';
import 'package:freestyle/model/user.dart';
import 'package:freestyle/service/userservice.dart';
import 'package:freestyle/utils/dimensions.dart';
import 'package:freestyle/utils/widgets.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var isLoading = true.obs;
  var isObsecure = true.obs;
  var isObsecureToo = true.obs; //for confirm password

  void validateStagenameForLogin(String stagename, User user) async {
    try {
      isLoading(true);
      var stageName = await UserService.isStageName(stagename);
      // debugPrint("Stage Name: $stageName");
      if ('Stage Name does not exists' == stageName) {
        //  debugPrint("Na wa this thing go work so");
        PageWidget.errorSnackbarWidget(
            title: "Stage Name status",
            msg: "Stage Name Does Not Exists!",
            icon: const Icon(Icons.person, color: Dimensions.blackColor));
      } else if ('Stage Name Exists' == stageName) {
        const Center(child: CircularProgressIndicator());
        login(user);
      }
    } catch (e) {
      //debugPrint("Error: $e");
      PageWidget.errorSnackbarWidget(
          title: "Error status",
          msg: "Error In Validating Stage Name!",
          icon: const Icon(Icons.person, color: Dimensions.blackColor));
    }
  } //validateStagenameForLogin

  void validateStagenameAndPasswordForRegistration(
      {required String stagename,
      required String password,
      required String confirmPassword,
      required User user,
      required List<Role> roles}) async {
    debugPrint("Nameddddd: $stagename");
    try {
      var stageName = await UserService.isStageName(stagename);
      debugPrint("Stageeee Name: $stageName");
      if ('Stage Name Exists' == stageName) {
        debugPrint("This stage name exists");
        PageWidget.errorSnackbarWidget(
            title: "Stage Name status",
            msg: "Stage Name Has Already Been Taken!",
            icon: const Icon(Icons.app_registration,
                color: Dimensions.blackColor));
      } else if (password != confirmPassword) {
        PageWidget.errorSnackbarWidget(
            title: "Password status",
            msg: "Passwords do not match!",
            icon: const Icon(Icons.app_registration,
                color: Dimensions.blackColor));
      } else if ('Stage Name does not exists' == stageName) {
        registerUser(user, roles);
      }
    } catch (e) {
      debugPrint("Error: $e");
      PageWidget.errorSnackbarWidget(
          title: "Error status",
          msg: "Error In Validating Stage Name: $e",
          icon: const Icon(Icons.person, color: Dimensions.blackColor));
    }
  } //validateStagenameForLogin

  void login(User user) async {
    try {
      isLoading(true);
      dynamic result = await UserService.loginUser(user);

      //   debugPrint("REsult: ${result.id}");
      PageWidget.successSnackbarWidget(
          title: "Login status",
          msg: "Congratulations Login Is Successful!",
          icon: const Icon(
            Icons.login,
            color: Dimensions.blackColor,
          ));

      Get.toNamed("/dashboard");
      //Get.to(() => Dashboard(), arguments: result);
    } catch (e) {
      debugPrint("Error: $e");
      PageWidget.errorSnackbarWidget(
          title: "Login status",
          msg: "Sorry Login Is Unsuccessful!",
          icon: const Icon(
            Icons.login,
            color: Dimensions.blackColor,
          ));
    }
  } //login

  void registerUser(User user, List<Role> roles) async {
    try {
      await UserService.registerUser(user, roles);
      PageWidget.successSnackbarWidget(
          title: "Register status",
          msg: "Congratulations Registration Is Successful!",
          icon: const Icon(
            Icons.app_registration,
            color: Dimensions.blackColor,
          ));
      Get.toNamed("/login");
    } catch (e) {
      debugPrint("Error: $e");
      PageWidget.errorSnackbarWidget(
          title: "Register status",
          msg: "Sorry Register Is Unsuccessful!",
          icon: const Icon(
            Icons.app_registration,
            color: Dimensions.blackColor,
          ));
    }
  } //registerUser
}
