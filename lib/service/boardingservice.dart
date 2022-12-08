class BoardingService {
  // static bool recordReport = false; //means no record is found

  // static Future<ProfileRequest> getProfile(userId) async {
  //   var url = "${Constants.profileDetailsUrl}$userId";
  //   debugPrint("Boarding Service url: $url");
  //   var response = await http.get(Uri.parse(url));
  //
  //   debugPrint(
  //       "BoardingService:getProfile:response.statuscode=> ${response.statusCode}");
  //   debugPrint("BoardingService:getProfile:response body=> ${response.body}");
  //   if (response.statusCode == 200) {
  //     recordReport = true;
  //     var data = jsonDecode(response.body);
  //     // debugPrint("Data: $data");
  //     //debugPrint("Data Id: ${data['id']}");
  //     // debugPrint("Data firstname: ${data['firstname']}");
  //     // debugPrint("Data lastname: ${data['lastname']}");
  //     debugPrint("Data phone: ${data['phone']}");
  //     // debugPrint("Data city: ${data['city']}");
  //     // debugPrint("Data country: ${data['country']}");
  //     // debugPrint("Data bio: ${data['bio']}");
  //     // debugPrint("Data pictureName: ${data['pictureName']}");
  //     // debugPrint("Data bannerName: ${data['bannerName']}");
  //     // debugPrint("Data picturez: ${data['picturez']}");
  //     // debugPrint("Data bannerz: ${data['bannerz']}");
  //     final dataValue = GetStorage(); //initialize getStorage
  //     dataValue.write('firstname', data['firstname']);
  //     dataValue.write('lastname', data['lastname']);
  //     dataValue.write('phone', data['phone']);
  //     dataValue.write('city', data['city']);
  //     dataValue.write('country', data['country']);
  //     dataValue.write('bio', data['bio']);
  //     dataValue.write('pictureName', data['pictureName']);
  //     dataValue.write('bannerName', data['bannerName']);
  //     dataValue.write('picturez', data['picturez']);
  //     dataValue.write('bannerz', data['bannerz']);
  //     return ProfileRequest.fromJson(data);
  //   } else {
  //     recordReport = false;
  //     throw Exception();
  //   }
  // }

//   static String accessTokenValue = '';
//
//   static Future<ProfileRequest> addProfile(
//       ProfileRequest profileRequest,
//       List<Hobby> hobbies,
//       List<Discipline> disciplines,
//       userId,
//       List<Genre> genres) async {
//     Map data = {
//       'userId': userId,
//       'firstname': profileRequest.firstname,
//       'lastname': profileRequest.lastname,
//       'phone': profileRequest.phone,
//       'city': profileRequest.city,
//       'country': profileRequest.country,
//       'genre': genres,
//       'discipline': disciplines,
//       'hobby': hobbies,
//       'bio': profileRequest.bio,
//       'pictureImage': profileRequest.picture,
//       'bannerImage': profileRequest.banner,
//       'question': profileRequest.question,
//       'answer': profileRequest.answer
//     };
//     try {
//       final dataValue = GetStorage();
//       if (dataValue.read('accessToken') != null) {
//         accessTokenValue = dataValue.read('accessToken');
//       } else {
//         accessTokenValue = '';
//       }
//
//       var formData = FormData.fromMap({});
//       req.headers.addAll({
//         "content-type": "application/json",
//         "accept": "application/json",
//         "Content-Type": "multipart/form-data",
//         "Authorization": "Bearer $accessTokenValue"
//       });
//       // final http.Response response = await http.post(Uri.parse(url),
//       //     headers: {
//       //       "content-type": "application/json",
//       //       "accept": "application/json",
//       //       "Content-Type": "multipart/form-data",
//       //       "Authorization": "Bearer $accessTokenValue"
//       //     },
//       //     body: jsonEncode(data));
//       var response = await req.send();
//       debugPrint("response: $response");
//       debugPrint("URL: $url");
//       debugPrint("Access Token: $accessTokenValue");
//       debugPrint("Response code : ${response.statusCode}");
//       var responsed = await http.Response.fromStream(response);
//       final resp = json.decode(responsed.body);
//       debugPrint("Response body : $resp");
//       // if (response.statusCode == 200) {
//       //   final data = response.body;
//       //   return ProfileRequest.fromJson(json.decode(data));
//       // }
//     } catch (e) {
//       debugPrint("Error in adding status: $e");
//       PageWidget.errorSnackbarWidget(
//           title: "Error status",
//           msg: "Error In Adding Profile",
//           icon: const Icon(
//             Icons.app_registration,
//             color: Dimensions.blackColor,
//           ));
//     }
//     return ProfileRequest.name(
//         firstname: profileRequest.firstname, lastname: profileRequest.lastname);
//   } //addProfile
} //BoardingService
