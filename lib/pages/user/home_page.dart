import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/dimensions.dart';
import '../../utils/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: Dimensions.height80,
                              horizontal:
                                  Dimensions.SCREEN_WIDTH - Dimensions.width20),
                          decoration: BoxDecoration(
                            color: Dimensions.greyColor,
                            image: const DecorationImage(
                              image: AssetImage('assets/images/logo.jpg'),
                              fit: BoxFit.cover,
                            ),
                            border: Border.all(
                              width: 8,
                            ),
                            borderRadius:
                                BorderRadius.circular(Dimensions.height20),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Center(
                            child: Padding(
                              padding:
                                  EdgeInsets.only(top: Dimensions.height60),
                              child: Column(
                                children: [
                                  PageWidget.textWidget(
                                      textLabel: "WELCOME TO THE PODIUM,",
                                      fontFamily: "OpenSans",
                                      fontSize: Dimensions.height20,
                                      fontWeight: FontWeight.w900,
                                      textColor: Dimensions.whiteColor),
                                  SizedBox(height: Dimensions.height5),
                                  PageWidget.textWidget(
                                      textLabel:
                                          "THE CENTER OF LYRICAL DIVINITIES",
                                      fontFamily: "OpenSans",
                                      fontSize: Dimensions.height20,
                                      fontWeight: FontWeight.w900,
                                      textColor: Dimensions.whiteColor),
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: Dimensions.height40),
                                    child: PageWidget.materialButton(
                                      bgColor: Dimensions.lightBlackColor,
                                      onPressed: login,
                                      buttonText: "LOGIN",
                                      textColor: Dimensions.whiteColor,
                                    ),
                                  ),
                                  SizedBox(height: Dimensions.height10),
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: Dimensions.height40),
                                    child: PageWidget.materialButton(
                                      bgColor: Dimensions.lightBlackColor,
                                      onPressed: register,
                                      buttonText: "REGISTER",
                                      textColor: Dimensions.whiteColor,
                                    ),
                                  ),
                                  SizedBox(height: Dimensions.height5),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: Dimensions.height10),
                                    child: PageWidget.textWidget(
                                        textLabel: "OR",
                                        fontFamily: 'OpenSans',
                                        fontSize: Dimensions.height25,
                                        fontWeight: FontWeight.w900,
                                        textColor: Dimensions.whiteColor),
                                  ),
                                  SizedBox(height: Dimensions.height5),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                          color: Dimensions.whiteColor,
                                          iconSize: Dimensions.height30,
                                          onPressed: facebook,
                                          icon: const Icon(Icons.facebook)),
                                      IconButton(
                                          color: Dimensions.whiteColor,
                                          iconSize: Dimensions.height30,
                                          onPressed: twitter,
                                          icon: const Icon(
                                              Icons.border_inner_rounded)),
                                      IconButton(
                                          color: Dimensions.whiteColor,
                                          iconSize: Dimensions.height30,
                                          onPressed: facebook,
                                          icon: const Icon(Icons.g_mobiledata)),
                                    ],
                                  ),
                                  SizedBox(height: Dimensions.height5),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: Dimensions.height5),
                                    child: PageWidget.materialButton(
                                      bgColor: Dimensions.backGroundColor,
                                      onPressed: tac,
                                      buttonText: "TERMS AND CONDITIONS",
                                      textColor: Dimensions.whiteColor,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
    Get.toNamed("/register");
  }

  facebook() {
    Get.snackbar("Social", "Facebook");
  }

  twitter() {
    Get.snackbar("Social", "Twitter");
  }

  google() {
    Get.snackbar("Social", "Google");
  }

  tac() {
    Get.snackbar("TAC", "Terms and Conditions");
  }
}