import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:freestyle/model/profile_request.dart';
import 'package:freestyle/utils/constants.dart';
import 'package:freestyle/utils/widgets.dart';
import 'package:get/get.dart' as gt;
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class BoardingController extends gt.GetxController {
  var activeStepIndex = 0.obs;
  var countryValue = ''.obs;
  var stateValue = ''.obs;
  var cityValue = ''.obs;
  var stepperButtonText = ''.obs;

  //store initial values from combo boxes
  List<dynamic> genreValues = [].obs;
  List<dynamic> disciplineValues = [].obs;
  List<dynamic> hobbyValues = [].obs;
  List<dynamic> securityValues = [].obs;

  //store unique values after filtering
  List<dynamic> genreArray = [].obs;
  List<dynamic> disciplineArray = [].obs;
  List<dynamic> hobbyArray = [].obs;
  List<dynamic> securityArray = [].obs;

  var answerValue = ''.obs;

  var isLoading = true.obs;

  var selectedPicturePath = ''.obs;
  var selectedBannerPath = ''.obs;
  static String accessTokenValue = '';

  var recordStatus = false.obs;

  // @override
  // void onInit() {
  //   super.onInit();
  //   int userId = 0;
  //   debugPrint('Started init method');
  //
  //   final dataValue = GetStorage();
  //   if (dataValue.read('userId') != null) {
  //     userId = dataValue.read('userId');
  //   }
  //   getProfile(userId);
  //
  //   var url = "${Constants.profileDetailsUrl}$userId";
  //   debugPrint("Boarding Controller init url: $url");
  //   debugPrint('Ended init method');
  //   debugPrint('Ended init method: recordstaus: $recordStatus');
  // }

  void getPictureImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      //selectedImagePath.value = pickedFile.path;
      var path = pickedFile.path;
      //selectedImageSize.value = ((File(selectedImagePath.value)).lengthSync()/1024/1024).toStringAsFixed(2);
      // var parts = path.split('/');
      //  selectedPicturePath.value = parts[parts.length - 1].trim();
      selectedPicturePath.value = path;
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
      //var parts = path.split('/');
      // selectedBannerPath.value = parts[parts.length - 1].trim();
      selectedBannerPath.value = path;
    } else {
      PageWidget.errorSnackbarWidget(
          title: "Error status",
          msg: "No Image Selected",
          icon: const Icon(Icons.image));
    }
  }

  // void addProfile(
  //     {required ProfileRequest profileRequest,
  //     required List<Genre> genres,
  //     required List<Discipline> disciplines,
  //     required List<Hobby> hobbies,
  //     required userId}) async {
  //   try {
  //     await BoardingService.addProfile(
  //         profileRequest, hobbies, disciplines, userId, genres);
  //     PageWidget.successSnackbarWidget(
  //         title: "Profile status",
  //         msg: "Congratulations Addition Of New Profile Is Successful!",
  //         icon: const Icon(
  //           Icons.app_registration,
  //           color: Dimensions.blackColor,
  //         ));
  //   } catch (e) {
  //     debugPrint("Profile Controller Error: $e");
  //     PageWidget.errorSnackbarWidget(
  //         title: "Profile status",
  //         msg: "Sorry Addition Of New Profile Is Unsuccessful!",
  //         icon: const Icon(
  //           Icons.app_registration,
  //           color: Dimensions.blackColor,
  //         ));
  //   }
  // }

  // Rx<PlatformFile> profilePictureFile =
  //     PlatformFile(name: 'platform', size: 1500).obs;
  // Rx<PlatformFile> profileBannerFile =
  //     PlatformFile(name: 'platform', size: 1500).obs;
  // // PlatformFile profileBannerFile = null.obs as PlatformFile;

  void increaseSteps() {
    activeStepIndex += 1;
  }

  void decreaseSteps() {
    activeStepIndex -= 1;
  }

  void addProfile(ProfileRequest profileRequest, List<dynamic> genres,
      List<dynamic> disciplines, List<dynamic> hobbies, userId) async {
    var formData = FormData.fromMap({
      "user_id": userId,
      "firstname": profileRequest.firstname,
      "lastname": profileRequest.lastname,
      "phone": profileRequest.phone,
      "city": profileRequest.city,
      "country": profileRequest.country,
      "bio": profileRequest.bio,
      "question": profileRequest.question,
      "answer": profileRequest.answer,
      "genre": genres,
      "discipline": disciplines,
      "hobby": hobbies,
      "pictureName": profileRequest.pictureName?.split("/").last,
      "bannerName": profileRequest.bannerName?.split("/").last,
      "pictureImage": await MultipartFile.fromFile(profileRequest.picture!,
          filename: profileRequest.picture),
      "bannerImage": await MultipartFile.fromFile(profileRequest.banner!,
          filename: profileRequest.banner)
    });

    try {
      final dataValue = GetStorage();
      if (dataValue.read('accessToken') != null) {
        accessTokenValue = dataValue.read('accessToken');
      } else {
        accessTokenValue = '';
      }
      debugPrint("Before Response");
      var url = "${Constants.addProfileUrl}$userId";
      debugPrint("URL: $url");
      Response response = await Dio().post(url,
          data: formData,
          options: Options(responseType: ResponseType.plain, headers: {
            "content-type": "application/json;charset=UTF-8",
            "accept": "application/json",
            "Content-Type": "multipart/form-data",
            "Authorization": "Bearer $accessTokenValue"
          }));
      debugPrint("Completed response: $response");
      gt.Get.toNamed("/dashboard");
      PageWidget.successSnackbarWidget(
          title: "Profile Status",
          msg: "Congratulations! Profile Added Successfully.",
          icon: const Icon(Icons.person_outline));
    } catch (e) {
      PageWidget.errorSnackbarWidget(
          title: "Profile Status",
          msg: "Error in adding Profile",
          icon: const Icon(Icons.person));
      debugPrint("Profile Error: $e");
    }
  }

  ///add profile

  Future<ProfileRequest> getProfile(userId) async {
    var url = "${Constants.profileDetailsUrl}$userId";
    debugPrint("Boarding Controller url: $url");
    var response = await http.get(Uri.parse(url));

    debugPrint(
        "BoardingController:getProfile:response.statuscode=> ${response.statusCode}");
    debugPrint(
        "BoardingController:getProfile:response body=> ${response.body}");
    if (response.statusCode == 200) {
      recordStatus.value = true;
      debugPrint("response status at statusCode : ${recordStatus.value}");
      var data = jsonDecode(response.body);
      final dataValue = GetStorage(); //initialize getStorage
      debugPrint("Data at BoardingController firstname: ${data['firstname']}");
      dataValue.write('firstname', data['firstname']);
      dataValue.write('lastname', data['lastname']);
      dataValue.write('phone', data['phone']);
      dataValue.write('city', data['city']);
      dataValue.write('country', data['country']);
      dataValue.write('bio', data['bio']);
      dataValue.write('pictureName', data['pictureName']);
      dataValue.write('rs', recordStatus.value);
      debugPrint("rs: ${data['rs']}");
      dataValue.write('bannerName', data['bannerName']);
      dataValue.write('picturez', data['picturez']);
      dataValue.write('bannerz', data['bannerz']);
      debugPrint(
          'record status flag before return statement: ${recordStatus.value}');
      return ProfileRequest.fromJsonAgain(data);
    } else {
      recordStatus.value = false;
      debugPrint('record status flag in else statement: ${recordStatus.value}');
      throw Exception();
    }

    // ProfileRequest profile = ProfileRequest();
    // try {
    //   isLoading(true);
    //   profile = await BoardingService.getProfile(userId);
    //   if (profile != null) {
    //     debugPrint("boardingController profile: $profile");
    //     return profile;
    //   }
    // } catch (e) {
    //   debugPrint("Error: $e");
    // }
    // return profile;
  } //getProfile

  // downloadPictureImage(pictureName) async {
  //   var url = "${Constants.downloadPictureUrl}$pictureName";
  //   debugPrint("Boarding Controller picture Image url: $url");
  //   var response = await http.get(Uri.parse(url));
  //
  //   if (response.statusCode == 200) {
  //     var data = jsonDecode(response.body);
  //     debugPrint('pictureImageeeeeeeeeeee: $data');
  //
  //     return data;
  //   } else {
  //     throw Exception();
  //   }
  // } //downloadPictureImage

}
