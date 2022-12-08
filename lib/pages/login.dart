import 'package:flutter/material.dart';
import 'package:freestyle/controller/user_controller.dart';
import 'package:freestyle/model/user.dart';
import 'package:freestyle/utils/widgets.dart';
import 'package:get/get.dart';

import '../utils/dimensions.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  UserController c = Get.put(UserController());
  final formKey = GlobalKey<FormState>();

  TextEditingController stagenameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  validateStagename() async {
    User user = User.login(
        stagename: stagenameController.text.trim(),
        password: passwordController.text.trim());
    try {
      c.validateStagenameForLogin(stagenameController.text.trim(), user);
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyFrame(context),
    );
  }

  Widget bodyFrame(BuildContext context) {
    if (context.isPortrait) {
      return portrait();
    } else {
      return landscape();
    }
  } //bodyFrame()

  Widget portrait() {
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
                flex: 3,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: Dimensions.height30),
                    child: Column(
                      children: [
                        // PageWidget.textWidget(
                        //     textLabel: "Freestyle League",
                        //     fontFamily: "OpenSans",
                        //     fontSize: Dimensions.height40,
                        //     fontWeight: FontWeight.w800,
                        //     textColor: Dimensions.lightGreyColor),
                        //Image.asset("assets/images/miniLogo.jpg"),
                        Container(
                          padding: EdgeInsets.only(top: Dimensions.height5),
                          child: PageWidget.textWidget(
                              textLabel: "Sign In",
                              fontFamily: "OpenSans",
                              fontSize: Dimensions.height30,
                              fontWeight: FontWeight.w700,
                              textColor: Dimensions.lightGreyColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 6,
                  child: Container(
                    padding: EdgeInsets.all(Dimensions.height5),
                    child: Form(
                      key: formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        children: [
                          PageWidget.textFormFieldWidget(
                              valLabel: "Stage Name",
                              hintText: "Stage Name",
                              prefixIcon: Icons.person,
                              textInput: TextInputType.text,
                              controller: stagenameController,
                              borderColor: Dimensions.lightGreyColor,
                              fillColor: Dimensions.blackColor,
                              textColor: Dimensions.lightGreyColor,
                              isObsecure: false,
                              validator: valStageName),
                          SizedBox(
                            height: Dimensions.height5,
                          ),
                          passwordWidget(),
                          SizedBox(
                            height: Dimensions.height10,
                          ),
                          PageWidget.materialButton(
                            bgColor: Dimensions.purpleColor,
                            onPressed: login,
                            buttonText: "LOGIN",
                            textColor: Dimensions.whiteColor,
                          ),
                          SizedBox(
                            height: Dimensions.height5,
                          ),
                          PageWidget.materialButton(
                            bgColor: Dimensions.blackColor,
                            onPressed: register,
                            buttonText: "Don\'t have an account, Sign Up Here",
                            textColor: Dimensions.lightGreyColor,
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
  } //potrait

  Widget landscape() {
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
                flex: 2,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: Dimensions.height20),
                    child: Column(
                      children: [
                        PageWidget.textWidget(
                            textLabel: "Freestyle League ",
                            fontFamily: "OpenSans",
                            fontSize: Dimensions.height25,
                            fontWeight: FontWeight.w700,
                            textColor: Dimensions.whiteColor),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 5,
                  child: Container(
                    padding: EdgeInsets.all(Dimensions.height5),
                    child: Form(
                      key: formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        children: [
                          SizedBox(
                            height: Dimensions.height25,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: Dimensions.width300,
                                  child: PageWidget.textFormFieldWidget(
                                      valLabel: "Stage Name",
                                      hintText: "Stage Name",
                                      prefixIcon: Icons.person,
                                      textInput: TextInputType.text,
                                      controller: stagenameController,
                                      borderColor: Colors.white,
                                      fillColor: Dimensions.blackColor,
                                      textColor: Dimensions.backGroundColor,
                                      isObsecure: false),
                                ),
                                SizedBox(
                                  width: Dimensions.width300,
                                  child: passwordWidget(),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.height10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              PageWidget.materialButton(
                                bgColor: Dimensions.backGroundColor,
                                onPressed: register,
                                buttonText:
                                    "Don\'t have an account, Sign Up Here",
                                textColor: Dimensions.whiteColor,
                              ),
                              SizedBox(
                                width: Dimensions.width10,
                              ),
                              PageWidget.materialButton(
                                bgColor: Dimensions.backGroundColor,
                                onPressed: login,
                                buttonText: "LOGIN",
                                textColor: Dimensions.whiteColor,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  } //landscape()

  login() {
    try {
      if (formKey.currentState!.validate()) {
        const Center(child: CircularProgressIndicator());
        validateStagename();
      } else {
        debugPrint("Form validation not complete");
        PageWidget.errorSnackbarWidget(
            title: "Login Status",
            msg: "Please fill in all the parameters in the form",
            icon: const Icon(Icons.format_shapes));
      }
    } catch (e) {
      debugPrint("Error: $e");
    }
  } //login

  register() {
    Get.toNamed("/register");
  } //register

  Obx passwordWidget() {
    return Obx(
      () => TextFormField(
        // controller: titleController,
        controller: passwordController,
        validator: valPassword,
        obscureText: c.isObsecure.value,
        // keyboardType: TextInputType.none,
        style: TextStyle(
            fontSize: Dimensions.height20, color: Dimensions.lightGreyColor),
        decoration: InputDecoration(
            labelText: "Password",
            labelStyle: TextStyle(
                color: Dimensions.lightGreyColor,
                fontSize: Dimensions.height13),
            prefixIcon: const Icon(
              Icons.lock,
              color: Dimensions.lightGreyColor,
            ),
            suffixIcon: Obx(() => GestureDetector(
                onTap: () {
                  c.isObsecure.value = !c.isObsecure.value;
                },
                child: Icon(
                  c.isObsecure.value ? Icons.visibility_off : Icons.visibility,
                  color: Dimensions.lightGreyColor,
                ))),
            hintText: "Password...",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.height25),
              borderSide: const BorderSide(color: Dimensions.lightGreyColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.height25),
              borderSide: const BorderSide(color: Dimensions.lightGreyColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.height25),
              borderSide: const BorderSide(color: Dimensions.lightGreyColor),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.height25),
              borderSide: const BorderSide(color: Dimensions.lightGreyColor),
            ),
            contentPadding: EdgeInsets.symmetric(
                horizontal: Dimensions.width20, vertical: Dimensions.height20),
            fillColor: Dimensions.blackColor,
            filled: true),
      ),
    );
  } //passwordWidget

  dynamic valStageName(String? value) {
    // RegExp stagenameRegExp =
    //     RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    if (value!.isEmpty) {
      return "Stage Name is Required";
    } else if (value.length < 3) {
      return "Stage Name must be more than three(3) Characters";
      // } else if (!stagenameRegExp.hasMatch(value)) {
      //   return "Invalid Stage Name";
    } else {
      return null;
    }
  } //valStageName

  // dynamic valPassword(String? value) {
  //   RegExp passwordRegExp = RegExp(
  //       r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
  //   if (value!.isEmpty) {
  //     return "Password is Required";
  //   } else if (value!.length < 8) {
  //     return "The Password is too short, it must be at least eight(8) characters";
  //   } else if (!value.contains(RegExp(r'[0-9]'))) {
  //     return "Password must contain at least one number";
  //   }else if (!value.contains(RegExp(r'[A-Z]'))) {
  //     return "Password must contain at least one Capital Letter";
  //   }else if (!value.contains(RegExp(r'[a-z]'))) {
  //     return "Password must contain at least one Small Letter";
  //   }else if(!value.contains(RegExp(r'/^[ A-Za-z0-9_@./#&+-]*$/.'))){
  //     return "Password must contain at least one special character";
  //   }else if (!passwordRegExp.hasMatch(value)) {
  //     return "Invalid Password value";
  //   } else {
  //     return null;
  //   }
  // } //valStageName

  String? valPassword(String? value) {
    RegExp passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
    if (value!.isEmpty) {
      return "Password is Required";
    } else if (value.length < 8) {
      return "The Password is too short, it must be at least eight(8) characters";
    }
    // else if (!value.contains(RegExp(r'[0-9]'))) {
    //   return "Password must contain at least one number";
    // } else if (!value.contains(RegExp(r'[A-Z]'))) {
    //   return "Password must contain at least one Capital Letter";
    // } else if (!value.contains(RegExp(r'[a-z]'))) {
    //   return "Password must contain at least one Small Letter";
    // } else if (!passwordRegExp.hasMatch(value)) {
    //   return "Invalid Password value";
    // }
    else {
      return null;
    }
  }
} //validateName
