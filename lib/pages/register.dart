import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/dimensions.dart';
import '../utils/widgets.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

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
                flex: 3,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: Dimensions.height50),
                    child: Column(
                      children: [
                        PageWidget.textWidget(
                            textLabel: "Freestyle League",
                            fontFamily: "OpenSans",
                            fontSize: Dimensions.height40,
                            fontWeight: FontWeight.w900,
                            textColor: Dimensions.whiteColor),
                        // Image.asset("assets/images/miniLogo.jpg"),
                        Container(
                          padding: EdgeInsets.only(top: Dimensions.height20),
                          child: PageWidget.textWidget(
                              textLabel: "Sign UP",
                              fontFamily: "OpenSans",
                              fontSize: Dimensions.height30,
                              fontWeight: FontWeight.w900,
                              textColor: Dimensions.whiteColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Form(
                  //key: formKey,
                  child: Column(
                    children: [
                      SizedBox(
                          height: Dimensions.height40,
                          child: PageWidget.textWidget(
                              textLabel: "ALMOST THERE!",
                              fontFamily: 'OpenSans',
                              fontSize: Dimensions.height20,
                              fontWeight: FontWeight.w700,
                              textColor: Dimensions.whiteColor)),
                      SizedBox(
                        height: Dimensions.height2,
                      ),
                      SizedBox(
                          height: Dimensions.height40,
                          child: PageWidget.textWidget(
                              textLabel:
                                  "Be the first to know and claim 3 months back-stage pass. Fill the form below",
                              fontFamily: 'OpenSans',
                              fontSize: Dimensions.height10,
                              fontWeight: FontWeight.w500,
                              textColor: Dimensions.whiteColor)),
                      SizedBox(
                        height: Dimensions.height2,
                      ),
                      SizedBox(
                        height: Dimensions.height40,
                        child: PageWidget.textFormFieldWidget(
                            valLabel: "Stage Name",
                            hintText: "Stage Name",
                            prefixIcon: Icons.person,
                            borderColor: Colors.white,
                            fillColor: Dimensions.greyColor,
                            textColor: Dimensions.backGroundColor,
                            isObsecure: false),
                      ),
                      SizedBox(
                        height: Dimensions.height2,
                      ),
                      SizedBox(
                        height: Dimensions.height40,
                        child: PageWidget.textFormFieldWidget(
                            valLabel: "Email Address",
                            hintText: "Email Address",
                            prefixIcon: Icons.email,
                            borderColor: Colors.white,
                            fillColor: Dimensions.greyColor,
                            textColor: Dimensions.backGroundColor,
                            isObsecure: false),
                      ),
                      SizedBox(
                        height: Dimensions.height2,
                      ),
                      SizedBox(
                        height: Dimensions.height40,
                        child: PageWidget.textFormFieldWidget(
                            valLabel: "Age",
                            hintText: "Age",
                            prefixIcon: Icons.numbers_outlined,
                            borderColor: Colors.white,
                            fillColor: Dimensions.greyColor,
                            textColor: Dimensions.backGroundColor,
                            isObsecure: false),
                      ),
                      SizedBox(
                        height: Dimensions.height2,
                      ),
                      SizedBox(
                        height: Dimensions.height40,
                        child: PageWidget.textFormFieldWidget(
                            valLabel: "Password",
                            hintText: "Password",
                            prefixIcon: Icons.lock,
                            borderColor: Colors.white,
                            fillColor: Dimensions.greyColor,
                            textColor: Dimensions.backGroundColor,
                            isObsecure: true),
                      ),
                      SizedBox(
                        height: Dimensions.height2,
                      ),
                      SizedBox(
                        height: Dimensions.height40,
                        child: PageWidget.textFormFieldWidget(
                            valLabel: "Confirm Password",
                            hintText: "Confirm Password",
                            prefixIcon: Icons.lock,
                            borderColor: Colors.white,
                            fillColor: Dimensions.greyColor,
                            textColor: Dimensions.backGroundColor,
                            isObsecure: true),
                      ),
                      SizedBox(
                        height: Dimensions.height2,
                      ),
                      SizedBox(
                        height: Dimensions.height50,
                        child: PageWidget.materialButton(
                          bgColor: Dimensions.lightBlackColor,
                          onPressed: register,
                          buttonText: "Sign Up",
                          textColor: Dimensions.whiteColor,
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height50,
                        child: PageWidget.materialButton(
                          bgColor: Dimensions.backGroundColor,
                          onPressed: login,
                          buttonText: "Already have an account?, Sign In Here",
                          textColor: Dimensions.whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  login() {
    Get.toNamed("/login");
  }

  register() {
    Get.snackbar("register", "REgisester ");
  }
}
