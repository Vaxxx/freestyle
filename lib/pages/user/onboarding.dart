import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/material.dart';
import 'package:freestyle/controller/boarding_controller.dart';
import 'package:freestyle/pages/user/dashboard.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/dimensions.dart';
import '../../utils/widgets.dart';

class OnBoarding extends StatelessWidget {
  OnBoarding({Key? key}) : super(key: key);
  final BoardingController c = Get.put(BoardingController());
  final formKey = GlobalKey<FormState>();

  //texteditingcontrollers
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController genreController = TextEditingController();
  final TextEditingController disciplineController = TextEditingController();
  final TextEditingController hobbyController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController Controller = TextEditingController();
  final TextEditingController questionController = TextEditingController();
  final TextEditingController answerController = TextEditingController();

  String musicTitle = 'My Favorite Music Genre(s)';
  String disciplineTitle = "I am more of a...";
  String jobTitle = "I am a...";
  String securityQuestionTitle = "Select Security Question";

  addProfile() {
    //get genre value
    for (var genre in c.genreValue) {
      if (genre.contains(0)) {
        debugPrint('contains 0 ');
        c.array.add('RNB');
      }
      if (genre.contains(1)) {
        debugPrint('contains 1 ');
        c.array.add('Afro Pop');
      }
      if (genre.contains(2)) {
        debugPrint('contains2 ');
        c.array.add('High Life');
      }
      if (genre.contains(3)) {
        debugPrint('contains 3 ');
        c.array.add('High Pop');
      }
      if (genre.contains(4)) {
        debugPrint('contains 4 ');
        c.array.add('Ampiano');
      }
      if (genre.contains(5)) {
        debugPrint('contains 5 ');
        c.array.add('Reggae');
      }
      if (genre.contains(6)) {
        debugPrint('contains 6 ');
        c.array.add('Others');
      }
    } //end for

    var set = <String>{};
    List uniqueList = c.array.where((arr) => set.add(arr)).toList();
    debugPrint("UniqueList: $uniqueList");

    debugPrint(
        "Firstname: ${firstnameController.text.trim()} --- LastName: ${lastnameController.text.trim()}");
    debugPrint(
        "Phone: ${phoneController.text.trim()} --- Bio: ${bioController.text.trim()}");

    debugPrint("Array: ${c.array}");
    debugPrint("music: ${c.genreValue} --- Bio: ${bioController.text.trim()}");
    debugPrint("discipline: ${c.disciplineValues} --- job: ${c.jobValues}");
    debugPrint(
        "icty: ${c.cityValue.value} --- country: ${c.countryValue.value}");

    debugPrint(
        "profile Picture: ${c.selectedPicturePath.value} --- seurity question: ${c.securityValues}");
    debugPrint(
        "Banner Picture: ${c.selectedBannerPath.value} --- seurity answer: ${answerController.text.trim()}");
  } //addProfile

  // List of items in our dropdown menu

  var genreList = [
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
        //page 1
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
                    controller: firstnameController,
                    prefixIcon: Icons.person_outline_outlined,
                    borderColor: Dimensions.greyColor,
                    fillColor: Dimensions.whiteColor,
                    textColor: Dimensions.deepGreyColor,
                    isObsecure: false),
                PageWidget.textFormFieldWidget(
                    valLabel: "Last Name",
                    hintText: "Last Name",
                    controller: lastnameController,
                    prefixIcon: Icons.person_outline,
                    borderColor: Dimensions.greyColor,
                    fillColor: Dimensions.whiteColor,
                    textColor: Dimensions.deepGreyColor,
                    isObsecure: false),
                // PageWidget.textFormFieldWidget(
                //     valLabel: "Age",
                //     hintText: "Age...",
                //     prefixIcon: Icons.tag,
                //     borderColor: Dimensions.greyColor,
                //     fillColor: Dimensions.whiteColor,
                //     textColor: Dimensions.deepGreyColor,
                //     isObsecure: false),
                PageWidget.textFormFieldWidget(
                    valLabel: "Phone Number",
                    hintText: "Phone Number",
                    prefixIcon: Icons.phone,
                    controller: phoneController,
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
                      debugPrint("Country value: ${c.countryValue.value}");
                    },
                    onStateChanged: (value) {
                      c.stateValue.value = value;
                    },
                    onCityChanged: (value) {
                      c.cityValue.value = value;
                      debugPrint("City Value: ${c.cityValue.value}");
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
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
                      items: genreList,
                      title: musicTitle,
                      strings: c.genreValue),
                  PageWidget.dropdownWidget(
                      items: disciplineList,
                      title: disciplineTitle,
                      strings: c.disciplineValues),
                  PageWidget.dropdownWidget(
                      items: jobList, title: jobTitle, strings: c.jobValues),
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
                      controller: bioController,
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
                      title: securityQuestionTitle,
                      strings: c.securityValues),
                  SizedBox(height: Dimensions.height10),
                  PageWidget.textFormFieldWidget(
                      valLabel: "Enter Security Question Answer",
                      hintText: "Enter Security Question Answer",
                      controller: answerController,
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
              return Container(
                padding: const EdgeInsets.all(3),
                color: Dimensions.backGroundColor,
                child: Stepper(
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
                ),
              );
            }),
          )
        ]));
  }

  void onStepContinue() {
    bool isLastStep = (c.activeStepIndex.value == stepList().length - 1);
    //if (c.activeStepIndex.value < (stepList().length - 1)) {}
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
    c.getPictureImage(ImageSource.gallery);
    // final result = await FilePicker.platform.pickFiles();
    // if (result == null) return;
    // c.profilePictureFile = result.files.first as Rx<PlatformFile>;
    // debugPrint("C.ProfilePictureFile=> ${c.profilePictureFile}");
  }

  Future uploadProfileBanner() async {
    c.getBannerImage(ImageSource.gallery);
    // final result = await FilePicker.platform.pickFiles();
    // if (result == null) return;
    // c.profileBannerFile = result.files.first as Rx<PlatformFile>;
    // debugPrint("C.profileBannerFile => ${c.profileBannerFile}");
  }

  onboard() {
    debugPrint("I want it so bad");
    addProfile();
    Get.snackbar("Submit", "Your onboarding process was successful");
  }
}
