import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/material.dart';
import 'package:freestyle/controller/boarding_controller.dart';
import 'package:freestyle/model/profile_request.dart';
import 'package:freestyle/pages/user/dashboard.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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
  final TextEditingController bioController = TextEditingController();
  final TextEditingController answerController = TextEditingController();

  String genreTitle = 'My Favorite Music Genre(s)';
  String disciplineTitle = "I am more of a...";
  String hobbyTitle = "I am a...";
  String securityQuestionTitle = "Select One Security Question";

  addProfile() {
    final dataValue = GetStorage();

    var idValue = dataValue.read('userId');

    //get genre value
    for (var genre in c.genreValues) {
      if (genre.contains(0)) {
        // debugPrint('contains 0 ');
        c.genreArray.add('RNB');
      }
      if (genre.contains(1)) {
        //debugPrint('contains 1 ');
        c.genreArray.add('Afro Pop');
      }
      if (genre.contains(2)) {
        // debugPrint('contains2 ');
        c.genreArray.add('High Life');
      }
      if (genre.contains(3)) {
        //debugPrint('contains 3 ');
        c.genreArray.add('High Pop');
      }
      if (genre.contains(4)) {
        //debugPrint('contains 4 ');
        c.genreArray.add('Ampiano');
      }
      if (genre.contains(5)) {
        //debugPrint('contains 5 ');
        c.genreArray.add('Reggae');
      }
      if (genre.contains(6)) {
        // debugPrint('contains 6 ');
        c.genreArray.add('Others');
      }
    } //end for
    //get disciple values
    for (var discipline in c.disciplineValues) {
      if (discipline.contains(0)) {
        c.disciplineArray.add('Musician');
      }
      if (discipline.contains(1)) {
        c.disciplineArray.add('Producer');
      }
      if (discipline.contains(2)) {
        c.disciplineArray.add('Sound Engineer');
      }
      if (discipline.contains(3)) {
        c.disciplineArray.add('Composer');
      }
      if (discipline.contains(4)) {
        c.disciplineArray.add('Song Writer');
      }
      if (discipline.contains(5)) {
        c.disciplineArray.add('Dancer');
      }
      if (discipline.contains(6)) {
        c.disciplineArray.add('VJ/Host');
      }
      if (discipline.contains(7)) {
        c.disciplineArray.add('Music Lover');
      }
      if (discipline.contains(8)) {
        c.disciplineArray.add('Rather Not Say');
      }
      if (discipline.contains(9)) {
        c.disciplineArray.add('Others');
      }
    } //end for discipline
    //get hobby values
    for (var hobby in c.hobbyValues) {
      if (hobby.contains(0)) {
        c.hobbyArray.add('Student');
      }
      if (hobby.contains(1)) {
        c.hobbyArray.add('Worker');
      }
      if (hobby.contains(2)) {
        c.hobbyArray.add('Entertainer');
      }
      if (hobby.contains(3)) {
        c.hobbyArray.add('Unemployed');
      }
      if (hobby.contains(4)) {
        c.hobbyArray.add('Rather Not Say');
      }
      if (hobby.contains(6)) {
        c.hobbyArray.add('Others');
      }
    } //end for
//get security values
    for (var security in c.securityValues) {
      if (security.contains(0)) {
        c.securityArray.add('What was your childhood nickname?');
      }
      if (security.contains(1)) {
        c.securityArray
            .add('What is the name of your favorite childhood friend?');
      }
      if (security.contains(2)) {
        c.securityArray.add('In what city does your nearest sibling live?');
      }
      if (security.contains(3)) {
        c.securityArray.add('In what city or town was your first job?');
      }
      if (security.contains(4)) {
        c.securityArray
            .add('What is the name of the first school you attended?');
      }
    } //end for
//genre set
//     var genreSet = Set<String>();
//     List uniqueGenreList =
//         c.genreArray.where((arr) => genreSet.add(arr)).toList();

    //genre set
    var genreSet = <String>{};
    List uniqueGenreList =
        c.genreArray.where((arr) => genreSet.add(arr)).toList();

    //discipline set
    var disciplineSet = <String>{};
    List uniqueDisciplineList =
        c.disciplineArray.where((arr) => disciplineSet.add(arr)).toList();

    //hobby set
    var hobbySet = <String>{};
    List uniqueHobbyList =
        c.hobbyArray.where((arr) => hobbySet.add(arr)).toList();

    //security set
    var securitySet = <String>{};
    List uniqueSecurityList =
        c.securityArray.where((arr) => securitySet.add(arr)).toList();

    debugPrint(
        "Firstname: ${firstnameController.text.trim()} --- LastName: ${lastnameController.text.trim()}");
    debugPrint(
        "Phone: ${phoneController.text.trim()} --- Bio: ${bioController.text.trim()}");
    //
    // debugPrint("Array: ${c.genreArray}");
    debugPrint("genre: ${c.genreValues} --- Bio: ${bioController.text.trim()}");
    debugPrint(
        "Hobbbbbies: ${c.hobbyValues} --- Bio: ${bioController.text.trim()}");
    debugPrint("discipline: ${c.disciplineValues} --- hobby: ${c.hobbyValues}");
    debugPrint(
        "icty: ${c.cityValue.value} --- country: ${c.countryValue.value}");
    debugPrint("UniqueGenreListtt: $uniqueGenreList");
    debugPrint("uniqueDisciplineListtt: $uniqueDisciplineList");
    debugPrint("uniqueHobbyList: $uniqueHobbyList");
    debugPrint("uniqueSecurityList: ${uniqueSecurityList[0]}");
    debugPrint("profile Picture: ${c.selectedPicturePath.value}");
    debugPrint(
        "Banner Picture: ${c.selectedBannerPath.value} --- security answer: ${answerController.text.trim()}");

    //add profile
    List<Hobby> hobbyArrays = [];
    List<Discipline> disciplineArrays = [];
    List<Genre> genreArrays = [];
    for (var g in uniqueGenreList) {
      genreArrays.add(Genre.add(userId: idValue, name: g));
    }
    for (var h in uniqueHobbyList) {
      hobbyArrays.add(Hobby.add(userId: idValue, name: h));
    }
    debugPrint("hobby Arrays: ${hobbyArrays.toString()}");
    for (var d in uniqueDisciplineList) {
      disciplineArrays.add(Discipline.add(userId: idValue, name: d));
    }
    debugPrint('hobbyArrays: ${hobbyArrays[0].name}');
    debugPrint('genreArrays: ${genreArrays[0].name}');
    debugPrint('uniqueGenreList2: $uniqueGenreList');
    debugPrint('Hobby Unique list: $uniqueHobbyList');

    debugPrint("..........................................");
    debugPrint("Genre Arrays: $genreArrays");
    debugPrint("Hobby Arrays: $hobbyArrays");
    debugPrint("discipline Arrays: $disciplineArrays");
    debugPrint("..........................................");

    //  debugPrint("GenreArrays1: ${genreArrays[0].name}");
    ProfileRequest pRequest = ProfileRequest.user(
        firstname: firstnameController.text.trim(),
        lastname: lastnameController.text.trim(),
        phone: phoneController.text.trim(),
        city: c.cityValue.value,
        country: c.countryValue.value,
        bio: bioController.text.trim(),
        pictureName: c.selectedPicturePath.value.split("/").last,
        bannerName: c.selectedBannerPath.value.split("/").last,
        picture: c.selectedPicturePath.value,
        banner: c.selectedBannerPath.value,
        question: uniqueSecurityList[0],
        answer: answerController.text.trim());
    debugPrint('before');
    try {
      debugPrint('inside');
      c.addProfile(pRequest, uniqueGenreList, uniqueDisciplineList,
          uniqueHobbyList, idValue);
      debugPrint('after');
    } catch (e) {
      debugPrint("Onboarding Error: $e");
    }
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
  var hobbyList = [
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
              fontFamily: "Tangerine",
              fontSize: 25,
              fontWeight: FontWeight.w800,
              textColor: Dimensions.lightBlackColor),
          content: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PageWidget.textWidget(
                    textLabel: "PERSONAL INFO",
                    fontFamily: "OpenSans",
                    fontSize: Dimensions.height20,
                    fontWeight: FontWeight.w700,
                    textColor: Dimensions.lightGreyColor),
                SizedBox(height: Dimensions.height10),
                // PageWidget.textFieldWidget(
                //     valLabel: "First Name",
                //     hintText: "First Name..",
                //     prefixIcon: Icons.person,
                //     borderColor: Dimensions.lightGreyColor,
                //     fillColor: Dimensions.lightBlackColor,
                //     textColor: Dimensions.lightGreyColor,
                //     isObsecure: false,
                //     errorText: firstnameText,
                //     controller: firstnameController),
                PageWidget.textFormFieldWidget(
                    valLabel: "First Name",
                    hintText: "First Name...",
                    controller: firstnameController,
                    prefixIcon: Icons.person_outline_outlined,
                    borderColor: Dimensions.lightGreyColor,
                    fillColor: Dimensions.lightBlackColor,
                    textColor: Dimensions.lightGreyColor,
                    validator: firstnameText,
                    isObsecure: false),

                PageWidget.textFormFieldWidget(
                    valLabel: "Last Name",
                    hintText: "Last Name...",
                    controller: lastnameController,
                    prefixIcon: Icons.person_outline,
                    borderColor: Dimensions.lightGreyColor,
                    fillColor: Dimensions.lightBlackColor,
                    textColor: Dimensions.lightGreyColor,
                    validator: lastnameText,
                    isObsecure: false),

                PageWidget.textFormFieldWidget(
                    valLabel: "Phone Number",
                    hintText: "Phone Number...",
                    controller: phoneController,
                    prefixIcon: Icons.phone,
                    borderColor: Dimensions.lightGreyColor,
                    fillColor: Dimensions.lightBlackColor,
                    textColor: Dimensions.lightGreyColor,
                    validator: phoneText,
                    isObsecure: false),

                // PageWidget.textFieldWidget(
                //     valLabel: "Phone Number",
                //     hintText: "Phone Number..",
                //     prefixIcon: Icons.phone,
                //     borderColor: Dimensions.lightGreyColor,
                //     fillColor: Dimensions.lightBlackColor,
                //     textColor: Dimensions.lightGreyColor,
                //     isObsecure: false,
                //     errorText: phoneText,
                //     controller: phoneController),

                Container(
                  padding: EdgeInsets.all(Dimensions.height5),
                  decoration: BoxDecoration(
                      color: Dimensions.lightBlackColor,
                      border: Border.all(width: Dimensions.width5),
                      borderRadius: BorderRadius.circular(Dimensions.height10)),
                  child: SelectState(
                    dropdownColor: Dimensions.lightBlackColor,
                    style: const TextStyle(color: Dimensions.lightGreyColor),
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
                fontFamily: "Tangerine",
                fontSize: 30,
                fontWeight: FontWeight.w800,
                textColor: Dimensions.blackColor),
            content: Center(
                child: Container(
              padding: EdgeInsets.all(Dimensions.height5),
              decoration: BoxDecoration(
                  color: Dimensions.lightBlackColor,
                  border: Border.all(width: Dimensions.width5),
                  borderRadius: BorderRadius.circular(Dimensions.height15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PageWidget.textWidget(
                      textLabel: "MY INTEREST",
                      fontFamily: "OpenSans",
                      fontSize: Dimensions.height20,
                      fontWeight: FontWeight.w700,
                      textColor: Dimensions.lightGreyColor),
                  SizedBox(height: Dimensions.height10),
                  PageWidget.textWidget(
                      textLabel:
                          "Choose at least on tag that will define your interest and best-fit in the entertainment industry. 4 MAX",
                      fontFamily: "OpenSans",
                      fontSize: Dimensions.height15,
                      fontWeight: FontWeight.w500,
                      textColor: Dimensions.lightGreyColor),
                  SizedBox(height: Dimensions.height10),
                  PageWidget.dropdownWidget(
                      items: genreList,
                      title: genreTitle,
                      strings: c.genreValues),
                  PageWidget.dropdownWidget(
                      items: disciplineList,
                      title: disciplineTitle,
                      strings: c.disciplineValues),
                  PageWidget.dropdownWidget(
                      items: hobbyList,
                      title: hobbyTitle,
                      strings: c.hobbyValues),
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
                fontFamily: "Tangerine",
                fontSize: 30,
                fontWeight: FontWeight.w800,
                textColor: Dimensions.blackColor),
            content: Center(
                child: Container(
              padding: EdgeInsets.all(Dimensions.height10),
              decoration: BoxDecoration(
                  color: Dimensions.lightBlackColor,
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
                      textColor: Dimensions.lightGreyColor),
                  SizedBox(height: Dimensions.height10),
                  PageWidget.textWidget(
                      textLabel:
                          "You are almost there. Just a few more about you to attract cooler audience to you and better secure your account",
                      fontFamily: "OpenSans",
                      fontSize: Dimensions.height15,
                      fontWeight: FontWeight.w500,
                      textColor: Dimensions.lightGreyColor),
                  SizedBox(height: Dimensions.height10),
                  PageWidget.textFieldWidget(
                      valLabel: "Short & exciting bio about you",
                      hintText: "Short & exciting bio about you",
                      prefixIcon: Icons.info_outlined,
                      borderColor: Dimensions.blackColor,
                      controller: bioController,
                      fillColor: Dimensions.lightBlackColor,
                      textColor: Dimensions.lightGreyColor,
                      isObsecure: false,
                      // errorText: bioText,
                      maxLine: 8),
                  SizedBox(height: Dimensions.height5),
                  PageWidget.materialButton(
                      bgColor: Dimensions.indigoColor,
                      onPressed: uploadProfilePicture,
                      buttonText: "Upload Profile Picture",
                      textColor: Dimensions.lightGreyColor),
                  Obx(() => c.selectedPicturePath.value == ''
                      ? PageWidget.textWidget(
                          textLabel: "",
                          fontFamily: 'Tangerine',
                          fontSize: Dimensions.height5,
                          fontWeight: FontWeight.w500,
                          textColor: Dimensions.whiteColor)
                      : PageWidget.textWidget(
                          textLabel: "Profile Picture added",
                          fontFamily: 'OpenSans',
                          fontSize: Dimensions.height10,
                          fontWeight: FontWeight.w800,
                          textColor: Dimensions.lightGreyColor)),
                  SizedBox(height: Dimensions.height2),
                  PageWidget.materialButton(
                      bgColor: Dimensions.indigoColor,
                      onPressed: uploadProfileBanner,
                      buttonText: "Upload Profile Banner",
                      textColor: Dimensions.lightGreyColor),
                  Obx(() => c.selectedBannerPath.value == ''
                      ? PageWidget.textWidget(
                          textLabel: "",
                          fontFamily: 'OpenSans',
                          fontSize: Dimensions.height5,
                          fontWeight: FontWeight.w900,
                          textColor: Dimensions.whiteColor)
                      : PageWidget.textWidget(
                          textLabel: "Profile Banner added",
                          fontFamily: 'OpenSans',
                          fontSize: Dimensions.height10,
                          fontWeight: FontWeight.w800,
                          textColor: Dimensions.lightGreyColor)),
                  SizedBox(height: Dimensions.height2),
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
                fontFamily: "Tangerine",
                fontSize: 30,
                fontWeight: FontWeight.w800,
                textColor: Dimensions.blackColor),
            content: Center(
                child: Container(
              padding: EdgeInsets.all(Dimensions.height5),
              decoration: BoxDecoration(
                  color: Dimensions.lightBlackColor,
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
                      textColor: Dimensions.lightGreyColor),
                  SizedBox(height: Dimensions.height10),
                  PageWidget.textWidget(
                      textLabel:
                          "You are ready to hit the ground running with great vibes. Now it'\s time to better secure your account ",
                      fontFamily: "OpenSans",
                      fontSize: Dimensions.height15,
                      fontWeight: FontWeight.w500,
                      textColor: Dimensions.lightGreyColor),
                  SizedBox(height: Dimensions.height10),
                  PageWidget.dropdownWidget(
                      items: securityQuestionList,
                      title: securityQuestionTitle,
                      strings: c.securityValues),
                  SizedBox(height: Dimensions.height10),
                  PageWidget.textFieldWidget(
                      valLabel: "Enter Security Question Answer",
                      hintText: "Enter Security Question Answer..",
                      prefixIcon: Icons.question_answer,
                      borderColor: Dimensions.lightGreyColor,
                      fillColor: Dimensions.lightBlackColor,
                      textColor: Dimensions.lightGreyColor,
                      isObsecure: false,
                      // errorText: answerText ,
                      controller: answerController),
                  SizedBox(height: Dimensions.height5),
                  PageWidget.materialButton(
                      bgColor: Dimensions.blackColor,
                      onPressed: onboard,
                      buttonText: "SUBMIT PROFILE",
                      textColor: Dimensions.whiteColor)
                ],
              ),
            ))),
      ];

  @override
  Widget build(BuildContext context) {
    debugPrint('Answer Value: ${c.answerValue.value}');
    var ct = c.activeStepIndex.value;
    debugPrint('Selected valueee: ${c.selectedBannerPath.value}');
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
                color: Dimensions.lightBlackColor,
                borderRadius: BorderRadius.circular(17)),
            child: Obx(() {
              return Form(
                key: formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Stepper(
                  controlsBuilder: (BuildContext context, ControlsDetails ctx) {
                    return Container(
                      color: Dimensions.lightBlackColor,
                      padding: EdgeInsets.only(top: Dimensions.height20),
                      child: Row(
                        children: <Widget>[
                          PageWidget.materialButton(
                              bgColor: Dimensions.indigoColor,
                              onPressed: onStepCancel,
                              buttonText: 'CANCEL',
                              textColor: Dimensions.lightGreyColor),
                          SizedBox(
                            width: Dimensions.width20,
                          ),
                          PageWidget.materialButton(
                              bgColor: Dimensions.indigoColor,
                              onPressed: onStepContinue,
                              buttonText: "NEXT",
                              textColor: Dimensions.lightGreyColor),
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
      PageWidget.successSnackbarWidget(
          title: "On Boarding",
          msg: "This is the last page",
          icon: const Icon(Icons.border_all_rounded));
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
    debugPrint('answerController: ${answerController.text.toString()}');
    if (bioController.text.toString().isEmpty) {
      PageWidget.errorSnackbarWidget(
          title: "Bio Text",
          msg: "Please enter a bio about you to proceed",
          icon: const Icon(Icons.question_answer));
    } else if (answerController.text.toString().isEmpty) {
      debugPrint('It ant work');
      PageWidget.errorSnackbarWidget(
          title: "Answer Text",
          msg: "Please enter a security answer to proceed",
          icon: const Icon(Icons.message));
    } else {
      addProfile();
    }
    //   if (c.isFirstname.value == false) {
    //     // c.addProfileStatus.value == true;

    //   // Get.snackbar("Submit", "Your onboarding process was successful");
    // } else {
    //   c.addProfileStatus.value == false;
    // }
  }

  dynamic firstnameText(String? value) {
    if (value!.isEmpty) {
      return "First Name is Required";
    } else if (value.length < 3) {
      return "First Name must be more than three(3) Characters";
      // } else if (!stagenameRegExp.hasMatch(value)) {
      //   return "Invalid Stage Name";
    } else {
      return null;
    }
  }

  dynamic lastnameText(String? value) {
    if (value!.isEmpty) {
      return "Last Name is Required";
    } else if (value.length < 3) {
      return "Last Name must be more than three(3) Characters";
      // } else if (!stagenameRegExp.hasMatch(value)) {
      //   return "Invalid Stage Name";
    } else {
      return null;
    }
  }

  // dynamic? get firstnameText {
  //   final value = firstnameController.text;
  //   if (value.isEmpty) {
  //     c.isFirstname.value = true;
  //     return "First Name is Required";
  //   } else if (value.length < 3) {
  //     c.isFirstname.value = true;
  //     return "First Name must be more than three(3) Characters";
  //   } else {
  //     c.isFirstname.value = false;
  //     return null;
  //   }
  // } //FirstNameValidator
  dynamic phoneText(String? value) {
    if (value!.isEmpty) {
      return "Phone Number is Required";
    } else if (value.length < 10) {
      return "Phone Number must be more than Nine(9) Characters";
      // } else if (!stagenameRegExp.hasMatch(value)) {
      //   return "Invalid Stage Name";
    } else if (!value.isNum) {
      return "Phone Number can only be numbers!";
    } else {
      return null;
    }
  } //phoneValidator

  // dynamic bioText(String? value) {
  //   if (value!.isEmpty) {
  //     return "Bio value is Required";
  //   } else if (value.length < 10) {
  //     return "Your Bio  must have more than four(4) Characters";
  //   } else {
  //     return null;
  //   }
  // }
  dynamic get bioText {
    final value = bioController.text;
    if (value.isEmpty) {
      return "Bio value is Required";
    } else if (value.length < 10) {
      return "Your Bio  must have more than four(4) Characters";
    } else if (value.length > 999) {
      return "Your Bio  cannot have up to a Thousand(1000) Characters";
    } else {
      return '';
    }
  }

  // String? answerText(String? value) {
  // dynamic get answerText {
  //   final value = answerController.text;
  //   if (value.isEmpty) {
  //     return "Answer value is Required";
  //   } else if (value.length < 4) {
  //     return "The Answer  must be more than four(4) Characters";
  //   } else {
  //     return '';
  //   }
  // } //answerText

  // String? answerText(String? value) {
  dynamic get answerText {
    debugPrint('first answer: ${c.answerValue.value}');
    c.answerValue.value = answerController.text;
    if (c.answerValue.value.isEmpty) {
      return "Answer value is Required";
    } else if (c.answerValue.value.length < 4) {
      return "The Answer  must be more than four(4) Characters";
    } else {
      return '';
    }
    debugPrint('second answer: ${c.answerValue.value}');
  } //ansswerText

}
