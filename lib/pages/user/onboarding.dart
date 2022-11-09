import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freestyle/controller/boarding_controller.dart';
import 'package:freestyle/pages/user/dashboard.dart';
import 'package:get/get.dart';

import '../../utils/dimensions.dart';
import '../../utils/widgets.dart';

class OnBoarding extends StatelessWidget {
  OnBoarding({Key? key}) : super(key: key);
  final BoardingController c = Get.put(BoardingController());

  String musicTitle = 'My Favorite Music Genre(s)';
  String disciplineTitle = "I am more of a...";
  String jobTitle = "I am a...";
  String securityQuestionTitle = "Select Security Question";

  // List of items in our dropdown menu

  var musicList = [
    'RNB',
    'Afro Pop',
    'High Life',
    'High Pop',
    'Ampiano',
    'Reggae',
    'Others'
  ];

  var disciplineList = [
    'Musician',
    'Producer',
    'Sound Engineer',
    'Composer',
    'Song Writer',
    'Dancer',
    'VJ/Host',
    'Music Lover',
    'Rather Not Say',
    'Others'
  ];
  var jobList = [
    'Student',
    'Worker',
    'Entertainer',
    'Unemployed',
    'Rather Not Say',
    'Others'
  ];

  var securityQuestionList = [
    'What was your childhood nickname?',
    'What is the name of your favorite childhood friend?',
    'In what city does your nearest sibling live?',
    'In what city or town was your first job?',
    'What is the name of the first school you attended?'
  ];

  List<Step> stepList() => [
        Step(
            state: c.activeStepIndex.value <= 0
                ? StepState.editing
                : StepState.complete,
            isActive: c.activeStepIndex.value >= 0,
            title: PageWidget.textWidget(
                textLabel: "1",
                fontFamily: "OpenSans",
                fontSize: 40,
                fontWeight: FontWeight.w900,
                textColor: Dimensions.blackColor),
            content: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PageWidget.textWidget(
                    textLabel: "PERSONAL INFO",
                    fontFamily: "OpenSans",
                    fontSize: Dimensions.height20,
                    fontWeight: FontWeight.w700,
                    textColor: Dimensions.whiteColor),
                SizedBox(height: Dimensions.height10),
                PageWidget.textFormFieldWidget(
                    valLabel: "First Name",
                    hintText: "First Name...",
                    prefixIcon: Icons.person_outline_outlined,
                    borderColor: Dimensions.greyColor,
                    fillColor: Dimensions.whiteColor,
                    textColor: Dimensions.deepGreyColor,
                    isObsecure: false),
                PageWidget.textFormFieldWidget(
                    valLabel: "Last Name",
                    hintText: "Last Name",
                    prefixIcon: Icons.person_outline,
                    borderColor: Dimensions.greyColor,
                    fillColor: Dimensions.whiteColor,
                    textColor: Dimensions.deepGreyColor,
                    isObsecure: false),
                PageWidget.textFormFieldWidget(
                    valLabel: "Age",
                    hintText: "Age...",
                    prefixIcon: Icons.tag,
                    borderColor: Dimensions.greyColor,
                    fillColor: Dimensions.whiteColor,
                    textColor: Dimensions.deepGreyColor,
                    isObsecure: false),
                PageWidget.textFormFieldWidget(
                    valLabel: "Phone Number",
                    hintText: "Phone Number",
                    prefixIcon: Icons.phone,
                    borderColor: Dimensions.greyColor,
                    fillColor: Dimensions.whiteColor,
                    textColor: Dimensions.deepGreyColor,
                    isObsecure: false),
                Container(
                  padding: EdgeInsets.all(Dimensions.height5),
                  decoration: BoxDecoration(
                      color: Dimensions.whiteColor,
                      border: Border.all(width: Dimensions.width5),
                      borderRadius: BorderRadius.circular(Dimensions.height10)),
                  child: SelectState(
                    // style: TextStyle(color: Colors.red),
                    onCountryChanged: (value) {
                      c.countryValue.value = value;
                    },
                    onStateChanged: (value) {
                      c.stateValue.value = value;
                    },
                    onCityChanged: (value) {
                      c.cityValue.value = value;
                    },
                  ),
                ),
              ],
            ))),

        //page 2
        Step(
            state: c.activeStepIndex.value <= 1
                ? StepState.editing
                : StepState.complete,
            isActive: c.activeStepIndex.value >= 1,
            title: PageWidget.textWidget(
                textLabel: "2",
                fontFamily: "OpenSans",
                fontSize: 40,
                fontWeight: FontWeight.w900,
                textColor: Dimensions.blackColor),
            content: Center(
                child: Container(
              padding: EdgeInsets.all(Dimensions.height5),
              decoration: BoxDecoration(
                  color: Dimensions.whiteColor,
                  border: Border.all(width: Dimensions.width5),
                  borderRadius: BorderRadius.circular(Dimensions.height10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PageWidget.textWidget(
                      textLabel: "MY INTEREST",
                      fontFamily: "OpenSans",
                      fontSize: Dimensions.height20,
                      fontWeight: FontWeight.w700,
                      textColor: Dimensions.blackColor),
                  SizedBox(height: Dimensions.height10),
                  PageWidget.textWidget(
                      textLabel:
                          "Choose at least on tag that will define your interest and best-fit in the entertainment industry. 4 MAX",
                      fontFamily: "OpenSans",
                      fontSize: Dimensions.height15,
                      fontWeight: FontWeight.w500,
                      textColor: Dimensions.blackColor),
                  SizedBox(height: Dimensions.height10),
                  PageWidget.dropdownWidget(
                      items: musicList, title: musicTitle),
                  PageWidget.dropdownWidget(
                      items: disciplineList, title: disciplineTitle),
                  PageWidget.dropdownWidget(items: jobList, title: jobTitle),
                ],
              ),
            ))),

        //page 3
        Step(
            state: c.activeStepIndex.value <= 2
                ? StepState.editing
                : StepState.complete,
            isActive: c.activeStepIndex.value >= 2,
            title: PageWidget.textWidget(
                textLabel: "3",
                fontFamily: "OpenSans",
                fontSize: 40,
                fontWeight: FontWeight.w900,
                textColor: Dimensions.blackColor),
            content: Center(
                child: Container(
              padding: EdgeInsets.all(Dimensions.height10),
              decoration: BoxDecoration(
                  color: Dimensions.whiteColor,
                  border: Border.all(width: Dimensions.width10),
                  borderRadius: BorderRadius.circular(Dimensions.height10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PageWidget.textWidget(
                      textLabel: "FINISHING TOUCHES",
                      fontFamily: "OpenSans",
                      fontSize: Dimensions.height20,
                      fontWeight: FontWeight.w700,
                      textColor: Dimensions.blackColor),
                  SizedBox(height: Dimensions.height10),
                  PageWidget.textWidget(
                      textLabel:
                          "You are almost there. Just a few more about you to attract cooler audience to you and better secure your account",
                      fontFamily: "OpenSans",
                      fontSize: Dimensions.height15,
                      fontWeight: FontWeight.w500,
                      textColor: Dimensions.blackColor),
                  SizedBox(height: Dimensions.height10),
                  PageWidget.textFieldWidget(
                      valLabel: "Short & exciting bio about you",
                      hintText: "Short & exciting bio about you",
                      prefixIcon: Icons.info_outlined,
                      borderColor: Dimensions.blackColor,
                      fillColor: Dimensions.whiteColor,
                      textColor: Dimensions.blackColor,
                      isObsecure: false,
                      maxLine: 8),
                  SizedBox(height: Dimensions.height5),
                  PageWidget.materialButton(
                      bgColor: Dimensions.blackColor,
                      onPressed: uploadProfilePicture,
                      buttonText: "Upload Profile Picture",
                      textColor: Dimensions.whiteColor),
                  SizedBox(height: Dimensions.height2),
                  PageWidget.materialButton(
                      bgColor: Dimensions.blackColor,
                      onPressed: uploadProfileBanner,
                      buttonText: "Upload Profile Banner",
                      textColor: Dimensions.whiteColor),
                ],
              ),
            ))),

        //page 4
        Step(
            state: c.activeStepIndex.value <= 3
                ? StepState.editing
                : StepState.complete,
            isActive: c.activeStepIndex.value >= 3,
            title: PageWidget.textWidget(
                textLabel: "4",
                fontFamily: "OpenSans",
                fontSize: 45,
                fontWeight: FontWeight.w900,
                textColor: Dimensions.blackColor),
            content: Center(
                child: Container(
              padding: EdgeInsets.all(Dimensions.height5),
              decoration: BoxDecoration(
                  color: Dimensions.whiteColor,
                  border: Border.all(width: Dimensions.width5),
                  borderRadius: BorderRadius.circular(Dimensions.height10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PageWidget.textWidget(
                      textLabel: "THERE YOU ARE!",
                      fontFamily: "OpenSans",
                      fontSize: Dimensions.height20,
                      fontWeight: FontWeight.w700,
                      textColor: Dimensions.blackColor),
                  SizedBox(height: Dimensions.height10),
                  PageWidget.textWidget(
                      textLabel:
                          "You are ready to hit the ground running with great vibes. Now it'\s time to better secure your account ",
                      fontFamily: "OpenSans",
                      fontSize: Dimensions.height15,
                      fontWeight: FontWeight.w500,
                      textColor: Dimensions.blackColor),
                  SizedBox(height: Dimensions.height10),
                  PageWidget.dropdownWidget(
                      items: securityQuestionList,
                      title: securityQuestionTitle),
                  SizedBox(height: Dimensions.height10),
                  PageWidget.textFormFieldWidget(
                      valLabel: "Enter Security Question Answer",
                      hintText: "Enter Security Question Answer",
                      prefixIcon: Icons.question_answer,
                      borderColor: Dimensions.greyColor,
                      fillColor: Dimensions.whiteColor,
                      textColor: Dimensions.blackColor,
                      isObsecure: false),
                  PageWidget.textWidget(
                      textLabel:
                          "* Your answer must be more than four(4) characters",
                      fontFamily: 'OpenSans',
                      fontSize: Dimensions.height10,
                      fontWeight: FontWeight.w400,
                      textColor: Dimensions.redColor),
                  SizedBox(height: Dimensions.height5),
                  PageWidget.materialButton(
                      bgColor: Dimensions.blackColor,
                      onPressed: onboard,
                      buttonText: "SUBMIT",
                      textColor: Dimensions.whiteColor)
                ],
              ),
            ))),
      ];

  @override
  Widget build(BuildContext context) {
    var ct = c.activeStepIndex.value;
    return Scaffold(
        // backgroundColor: Dimensions.blackColor,
        appBar: AppBar(
          backgroundColor: Dimensions.blackColor,
          leading: IconButton(
            icon: const Icon(Icons.backspace_outlined),
            iconSize: Dimensions.height20,
            color: Dimensions.whiteColor,
            onPressed: () => Get.to(Dashboard()),
          ),
        ),
        backgroundColor: Dimensions.backGroundColor,
        body: Stack(children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/bg.jpg"), fit: BoxFit.fill),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.black54, borderRadius: BorderRadius.circular(17)),
            child: Obx(() {
              return Stepper(
                controlsBuilder: (BuildContext context, ControlsDetails ctx) {
                  return Container(
                    padding: EdgeInsets.only(top: Dimensions.height20),
                    child: Row(
                      children: <Widget>[
                        PageWidget.materialButton(
                            bgColor: Dimensions.greyColor,
                            onPressed: onStepCancel,
                            buttonText: 'CANCEL',
                            textColor: Dimensions.blackColor),
                        SizedBox(
                          width: Dimensions.width20,
                        ),
                        PageWidget.materialButton(
                            bgColor: Dimensions.greyColor,
                            onPressed: onStepContinue,
                            buttonText: "NEXT",
                            textColor: Dimensions.blackColor),
                      ],
                    ),
                  );
                },
                type: StepperType.horizontal,
                currentStep: c.activeStepIndex.value,
                steps: stepList(),
                onStepContinue: () {
                  onStepContinue();
                },
                //onStepContinue
                onStepCancel: () {
                  onStepCancel();
                },
              );
            }),
          )
        ]));
  }

  void onStepContinue() {
    bool isLastStep = (c.activeStepIndex.value == stepList().length - 1);
    // if (c.activeStepIndex.value < (stepList().length - 1)) { }
    if (isLastStep) {
      //the last page information
      Get.snackbar("Last", "This is the last Page");
    } else {
      ///setstate
      c.increaseSteps();
    }
  }

  void onStepCancel() {
    if (c.activeStepIndex.value == 0) {
      return;
    }
    // c.activeStepIndex.value == 0
    //     ? c.stepperButtonText.value = ''
    //     : c.stepperButtonText.value = 'BACK';

    //c.activeStepIndex.value -= 1;
    c.decreaseSteps();
  }

  Future uploadProfilePicture() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    c.profilePictureFile = result.files.first as Rx<PlatformFile>;
  }

  Future uploadProfileBanner() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    c.profileBannerFile = result.files.first as Rx<PlatformFile>;
  }

  void onboard() {
    Get.snackbar("Submit", "Your onboarding process was successful");
  }
}
