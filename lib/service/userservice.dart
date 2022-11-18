import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:freestyle/model/user.dart';
import 'package:freestyle/utils/constants.dart';
import 'package:freestyle/utils/dimensions.dart';
import 'package:freestyle/utils/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class UserService {
  static Future<String> isStageName(String stagename) async {
    String url = "${Constants.isStagenameUrl}$stagename";
    debugPrint("URL: $url");
    try {
      final http.Response response = await http.get(Uri.parse(url));
      debugPrint("stage name: $stagename");
      debugPrint("statusCode: ${response.statusCode}");
      debugPrint("statusbody: ${response.body}");
      if (response.statusCode == 200) {
        const Center(child: CircularProgressIndicator());
        return response.body;
      } else {
        throw Exception();
      }
    } catch (e) {
      debugPrint("Error: $e");
      PageWidget.errorSnackbarWidget(
          title: "Error status",
          msg: "Error In Stage Name: $e",
          icon: const Icon(Icons.person, color: Dimensions.blackColor));
    }
    return "";
  } //isStageName

  static Future loginUser(User user) async {
    Map data = {'stagename': user.stagename, 'password': user.password};
    try {
      final http.Response response =
          await http.post(Uri.parse(Constants.loginUrl),
              headers: {
                "content-type": "application/json",
                "accept": "application/json",
              },
              body: jsonEncode(data));
      if (response.statusCode == 200) {
        debugPrint("The response body: ${response.body}");
        // Map data1 = response.body as Map;
        var value = jsonDecode(response.body);
        //add authentication values into get storage

        //first declare a variable for the get storage
        final dataValue = GetStorage(); //initialize getStorage

        //store email or write email to shared preference
        dataValue.write('email', value['email']);
        //store stagename
        dataValue.write('stagename', value['stagename']);
        //store tokenType
        dataValue.write('tokenType', value['tokenType']);
        //store accessToken
        dataValue.write('accessToken', value['accessToken']);

        return response.body;
      }
    } catch (e) {
      //debugPrint("ERROR in Login Process: $e");
      PageWidget.errorSnackbarWidget(
          title: "Error status",
          msg: "Error In Login Process",
          icon: const Icon(
            Icons.login,
            color: Dimensions.blackColor,
          ));
    }
  } //loginUser

  static Future<User> registerUser(User user, List<Role> roles) async {
    Map data = {
      'stagename': user.stagename,
      'email': user.email,
      'age': user.age,
      'password': user.password,
      'roles': roles
    };
    try {
      final http.Response response =
          await http.post(Uri.parse(Constants.registerUrl),
              headers: {
                "content-type": "application/json",
                "accept": "application/json",
              },
              body: jsonEncode(data));
      if (response.statusCode == 200) {
        debugPrint("The response body: ${response.body}");
        final data = response.body;

        return User.fromJson(json.decode(data));
      } else {
        throw Exception("Failed to register user");
      }
    } catch (e) {
      debugPrint("ERROR in registration Process: $e");
      PageWidget.errorSnackbarWidget(
          title: "Error status",
          msg: "Error In Registration Process",
          icon: const Icon(
            Icons.app_registration,
            color: Dimensions.blackColor,
          ));
    }
    return User.login(stagename: user.stagename, password: user.password);
  } //register User
}
