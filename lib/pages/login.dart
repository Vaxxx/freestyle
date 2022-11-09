import 'package:flutter/material.dart';
import 'package:freestyle/controller/user_controller.dart';
import 'package:freestyle/model/user.dart';
import 'package:get/get.dart';

import '../utils/dimensions.dart';
import '../utils/widgets.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  UserController c = Get.put(UserController());
  var formKey = GlobalKey<FormState>();

  //addc controllers to textformfields

  TextEditingController stagenameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  validateEmail() async {
    var data = {
      'stagename': stagenameController.text.trim(),
      'password': passwordController.text.trim()
    };

    try {
      // var response = await http.post(
      //     Uri.parse(Constants.allUserStagenameUrl),
      //     body: json.encode(data));
      // if (response.statusCode == 200) {
      //   var responseBody = jsonDecode(response.body);
      //   if (responseBody['Stage Name Exists']) {
      //     Get.snackbar("Login Status", "Stage Name is already in use.");
      //   } else {

      User user = User.login(
          stagename: stagenameController.text.trim(),
          password: passwordController.text.trim());

      c.login(user);
    } catch (e) {
      debugPrint("Error: $e");
    }

    // var response = await http.post(Uri.parse(Constants.loginUrl),
    //     headers: {
    //       "content-type": "application/json",
    //       "accept": "application/json",
    //     },
    //     body: json.encode(data));
    // debugPrint("StagenameController: ${stagenameController.text.trim()}");
    // debugPrint("PasswordController: ${passwordController.text.trim()}");
    // debugPrint("resonseStatuscode: ${response.statusCode}");
    // debugPrint("responseStatusBody:");
    // if (response.statusCode == 200) {
    //   Get.snackbar("Login Status", " Login Successful");
    // } else {
    //   Get.snackbar("Login Status", " Login UnSuccessful");
    // }
    // debugPrint("Login Url: ${Constants.loginUrl}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Dimensions.backGroundColor,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/bg.jpg"), fit: BoxFit.fill),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: Dimensions.height60),
                    child: Column(
                      children: [
                        PageWidget.textWidget(
                            textLabel: "Freestyle League",
                            fontFamily: "OpenSans",
                            fontSize: Dimensions.height40,
                            fontWeight: FontWeight.w900,
                            textColor: Dimensions.whiteColor),
                        // Image.asset("assets/images/miniLogo.jpg"),
                        // Container(
                        //   padding: EdgeInsets.only(top: Dimensions.height40),
                        //   child: PageWidget.textWidget(
                        //       textLabel: "Login",
                        //       fontFamily: "OpenSans",
                        //       fontSize: Dimensions.height30,
                        //       fontWeight: FontWeight.w900,
                        //       textColor: Dimensions.whiteColor),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 4,
                  child: Container(
                    padding: EdgeInsets.all(Dimensions.height5),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          PageWidget.textFormFieldWidget(
                              valLabel: "Stage Name",
                              hintText: "Stage Name",
                              prefixIcon: Icons.person,
                              controller: stagenameController,
                              borderColor: Colors.white,
                              fillColor: Dimensions.greyColor,
                              textColor: Dimensions.backGroundColor,
                              isObsecure: false),
                          SizedBox(
                            height: Dimensions.height10,
                          ),
                          PageWidget.textFormFieldWidget(
                              valLabel: "Password",
                              controller: passwordController,
                              hintText: "Password",
                              prefixIcon: Icons.lock,
                              borderColor: Colors.white,
                              fillColor: Dimensions.greyColor,
                              textColor: Dimensions.backGroundColor,
                              isObsecure: true),
                          SizedBox(
                            height: Dimensions.height20,
                          ),
                          PageWidget.materialButton(
                            bgColor: Dimensions.lightBlackColor,
                            onPressed: login,
                            buttonText: "LOGIN",
                            textColor: Dimensions.whiteColor,
                          ),
                          SizedBox(
                            height: Dimensions.height10,
                          ),
                          PageWidget.materialButton(
                            bgColor: Dimensions.backGroundColor,
                            onPressed: register,
                            buttonText: "Don\'t have an account, Sign Up Here",
                            textColor: Dimensions.whiteColor,
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }

  login() {
    validateEmail();
  }

  register() {
    Get.toNamed("/register");
  }
}
