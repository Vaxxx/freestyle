import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:freestyle/model/user.dart';
import 'package:freestyle/utils/constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserService {
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
        return response.body;
      }
    } catch (e) {
      debugPrint("ERROR in SERVICe: $e");
      Get.snackbar("Error", "Error in Login process");
    }
  }
}
