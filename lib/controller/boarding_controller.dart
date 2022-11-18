import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:freestyle/utils/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class BoardingController extends GetxController {
  var activeStepIndex = 0.obs;
  var countryValue = ''.obs;
  var stateValue = ''.obs;
  var cityValue = ''.obs;
  var stepperButtonText = ''.obs;
  List<dynamic> genreValue = [].obs;
  List<dynamic> disciplineValues = [].obs;
  List<dynamic> jobValues = [].obs;
  List<dynamic> securityValues = [].obs;
  List<dynamic> array = [].obs;

  var selectedPicturePath = ''.obs;
  var selectedBannerPath = ''.obs;

  void getPictureImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      //selectedImagePath.value = pickedFile.path;
      var path = pickedFile.path;
      //selectedImageSize.value = ((File(selectedImagePath.value)).lengthSync()/1024/1024).toStringAsFixed(2);
      var parts = path.split('/');
      selectedPicturePath.value = parts[parts.length - 1].trim();
    } else {
      PageWidget.errorSnackbarWidget(
          title: "Error status",
          msg: "No Image Selected",
          icon: const Icon(Icons.image));
    }
  }

  void getBannerImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      //selectedImagePath.value = pickedFile.path;
      var path = pickedFile.path;
      //selectedImageSize.value = ((File(selectedImagePath.value)).lengthSync()/1024/1024).toStringAsFixed(2);
      var parts = path.split('/');
      selectedBannerPath.value = parts[parts.length - 1].trim();
    } else {
      PageWidget.errorSnackbarWidget(
          title: "Error status",
          msg: "No Image Selected",
          icon: const Icon(Icons.image));
    }
  }

  Rx<PlatformFile> profilePictureFile =
      PlatformFile(name: 'platform', size: 1500).obs;
  Rx<PlatformFile> profileBannerFile =
      PlatformFile(name: 'platform', size: 1500).obs;
  // PlatformFile profileBannerFile = null.obs as PlatformFile;

  void increaseSteps() {
    activeStepIndex += 1;
  }

  void decreaseSteps() {
    activeStepIndex -= 1;
  }
}
