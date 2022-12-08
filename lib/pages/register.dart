import 'package:flutter/material.dart';
import 'package:freestyle/controller/user_controller.dart';
import 'package:freestyle/model/user.dart';
import 'package:get/get.dart';

import '../utils/dimensions.dart';
import '../utils/widgets.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);

  UserController c = Get.put(UserController());
  final formKey = GlobalKey<FormState>();

  TextEditingController stagenameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  validateStagenameAndPasswordForRegistration() async {
    List<Role> rolez = [Role.add(name: 'user')];
    User user = User.register(
      stagename: stagenameController.text.trim(),
      email: emailController.text.trim(),
      age: ageController.text.trim(),
      password: passwordController.text.trim(),
    );

    debugPrint("user: ${user.stagename} + ${user.email}");
    try {
      c.validateStagenameAndPasswordForRegistration(
          stagename: stagenameController.text.trim(),
          password: passwordController.text.trim(),
          confirmPassword: confirmPasswordController.text.trim(),
          user: user,
          roles: rolez);
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyFrame(context),
    );
  } //build

  Widget bodyFrame(BuildContext context) {
    if (context.isPortrait) {
      return portrait();
    } else {
      return landscape();
    }
  } //bodyFrame

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
                flex: 1,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: Dimensions.height50),
                    child: Column(
                      children: [
                        // PageWidget.textWidget(
                        //     textLabel: "Freestyle League",
                        //     fontFamily: "OpenSans",
                        //     fontSize: Dimensions.height30,
                        //     fontWeight: FontWeight.w800,
                        //     textColor: Dimensions.lightGreyColor),
                        // Image.asset("assets/images/miniLogo.jpg"),
                        // Container(
                        //   padding: EdgeInsets.only(top: Dimensions.height5),
                        //   child: PageWidget.textWidget(
                        //       textLabel: "Sign Up",
                        //       fontFamily: "OpenSans",
                        //       fontSize: Dimensions.height20,
                        //       fontWeight: FontWeight.w800,
                        //       textColor: Dimensions.lightGreyColor),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    children: [
                      SizedBox(
                          height: Dimensions.height20,
                          child: PageWidget.textWidget(
                              textLabel: "Sign Up",
                              fontFamily: 'OpenSans',
                              fontSize: Dimensions.height15,
                              fontWeight: FontWeight.w800,
                              textColor: Dimensions.whiteColor)),
                      SizedBox(
                          height: Dimensions.height20,
                          child: PageWidget.textWidget(
                              textLabel: "ALMOST THERE!",
                              fontFamily: 'OpenSans',
                              fontSize: Dimensions.height12,
                              fontWeight: FontWeight.w700,
                              textColor: Dimensions.lightGreyColor)),
                      SizedBox(
                        height: Dimensions.height2,
                      ),
                      SizedBox(
                          height: Dimensions.height35,
                          child: PageWidget.textWidget(
                              textLabel:
                                  "Be the first to know and claim 3 months back-stage pass. Fill the form below",
                              fontFamily: 'OpenSans',
                              fontSize: Dimensions.height15,
                              fontWeight: FontWeight.w500,
                              textColor: Dimensions.lightGreyColor)),
                      SizedBox(
                        height: Dimensions.height10,
                      ),
                      SizedBox(
                        height: Dimensions.height30,
                        child: PageWidget.textFormFieldWidget(
                            valLabel: "Stage Name",
                            validator: stagenameValidator,
                            hintText: "Stage Name",
                            prefixIcon: Icons.person,
                            textInput: TextInputType.text,
                            borderColor: Dimensions.lightGreyColor,
                            fillColor: Dimensions.blackColor,
                            textColor: Dimensions.lightGreyColor,
                            controller: stagenameController,
                            isObsecure: false),
                      ),
                      SizedBox(
                        height: Dimensions.height5,
                      ),
                      SizedBox(
                        height: Dimensions.height30,
                        child: PageWidget.textFormFieldWidget(
                            valLabel: "Email Address",
                            hintText: "Email Address",
                            validator: emailValidator,
                            controller: emailController,
                            prefixIcon: Icons.email,
                            textInput: TextInputType.emailAddress,
                            borderColor: Dimensions.lightGreyColor,
                            fillColor: Dimensions.blackColor,
                            textColor: Dimensions.lightGreyColor,
                            isObsecure: false),
                      ),
                      SizedBox(
                        height: Dimensions.height5,
                      ),
                      SizedBox(
                        height: Dimensions.height30,
                        child: PageWidget.textFormFieldWidget(
                            valLabel: "Age",
                            hintText: "Age",
                            validator: ageValidator,
                            prefixIcon: Icons.numbers_outlined,
                            controller: ageController,
                            textInput: TextInputType.number,
                            borderColor: Dimensions.lightGreyColor,
                            fillColor: Dimensions.blackColor,
                            textColor: Dimensions.lightGreyColor,
                            isObsecure: false),
                      ),
                      SizedBox(
                        height: Dimensions.height5,
                      ),
                      SizedBox(
                        height: Dimensions.height30,
                        child: passwordWidget(),
                      ),
                      SizedBox(
                        height: Dimensions.height5,
                      ),
                      SizedBox(
                        height: Dimensions.height30,
                        child: confirmPasswordWidget(),
                      ),
                      SizedBox(
                        height: Dimensions.height5,
                      ),
                      SizedBox(
                        height: Dimensions.height50,
                        child: PageWidget.materialButton(
                          bgColor: Dimensions.purpleColor,
                          onPressed: register,
                          buttonText: "Sign Up",
                          textColor: Dimensions.whiteColor,
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height50,
                        child: PageWidget.materialButton(
                          bgColor: Dimensions.blackColor,
                          onPressed: login,
                          buttonText: "Already have an account?, Sign In Here",
                          textColor: Dimensions.lightGreyColor,
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
  } //portrait()

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
                    padding: EdgeInsets.only(top: Dimensions.height30),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PageWidget.textWidget(
                                textLabel: "Freestyle League",
                                fontFamily: "OpenSans",
                                fontSize: Dimensions.height20,
                                fontWeight: FontWeight.w900,
                                textColor: Dimensions.whiteColor),
                            // Image.asset("assets/images/miniLogo.jpg"),
                            SizedBox(
                              width: Dimensions.width30,
                            ),
                            PageWidget.textWidget(
                                textLabel: "Sign Up",
                                fontFamily: "OpenSans",
                                fontSize: Dimensions.height20,
                                fontWeight: FontWeight.w700,
                                textColor: Dimensions.whiteColor),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      SizedBox(
                        height: Dimensions.height30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: Dimensions.width250,
                              child: PageWidget.textFormFieldWidget(
                                  valLabel: "Stage Name",
                                  hintText: "Stage Name",
                                  validator: stagenameValidator,
                                  prefixIcon: Icons.person,
                                  borderColor: Colors.white,
                                  textInput: TextInputType.text,
                                  fillColor: Dimensions.greyColor,
                                  textColor: Dimensions.backGroundColor,
                                  controller: stagenameController,
                                  isObsecure: false),
                            ),
                            SizedBox(
                              width: Dimensions.width150,
                              child: PageWidget.textFormFieldWidget(
                                  valLabel: "Age",
                                  hintText: "Age",
                                  validator: ageValidator,
                                  prefixIcon: Icons.numbers_outlined,
                                  controller: ageController,
                                  textInput: TextInputType.number,
                                  borderColor: Colors.white,
                                  fillColor: Dimensions.greyColor,
                                  textColor: Dimensions.backGroundColor,
                                  isObsecure: false),
                            ),
                            SizedBox(
                              width: Dimensions.width250,
                              child: PageWidget.textFormFieldWidget(
                                  valLabel: "Email Address",
                                  hintText: "Email Address",
                                  validator: emailValidator,
                                  controller: emailController,
                                  prefixIcon: Icons.email,
                                  textInput: TextInputType.emailAddress,
                                  borderColor: Colors.white,
                                  fillColor: Dimensions.greyColor,
                                  textColor: Dimensions.backGroundColor,
                                  isObsecure: false),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: Dimensions.height10),
                      SizedBox(
                        height: Dimensions.height30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: Dimensions.width250,
                              child: passwordWidget(),
                            ),
                            SizedBox(
                              width: Dimensions.width250,
                              child: confirmPasswordWidget(),
                            ),
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
                              onPressed: login,
                              buttonText:
                                  "Already have an account?, Sign In Here",
                              textColor: Dimensions.whiteColor,
                            ),
                            SizedBox(width: Dimensions.width30),
                            PageWidget.materialButton(
                              bgColor: Dimensions.backGroundColor,
                              onPressed: register,
                              buttonText: "Sign Up",
                              textColor: Dimensions.whiteColor,
                            ),
                          ]),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  } //landscape()

  login() {
    Get.toNamed("/login");
  }

  register() {
    if (formKey.currentState!.validate()) {
      validateStagenameAndPasswordForRegistration();
    } else {
      debugPrint("Form validation not complete");
      PageWidget.errorSnackbarWidget(
          title: "Registration Status",
          msg: "Please fill in all the parameters in the form",
          icon: const Icon(Icons.app_registration));
    }
  } //register

  Obx confirmPasswordWidget() {
    return Obx(
      () => SizedBox(
        height: Dimensions.height35,
        child: TextFormField(
          validator: passwordValidator,
          controller: confirmPasswordController,
          obscureText: c.isObsecureToo.value,
          keyboardType: TextInputType.text,
          style: TextStyle(
              fontSize: Dimensions.height20, color: Dimensions.lightGreyColor),
          decoration: InputDecoration(
              labelText: "Confirm Password",
              labelStyle: TextStyle(
                  color: Dimensions.lightGreyColor,
                  fontSize: Dimensions.height13),
              prefixIcon: const Icon(
                Icons.lock_outline_rounded,
                color: Dimensions.lightGreyColor,
              ),
              suffixIcon: Obx(() => GestureDetector(
                  onTap: () {
                    c.isObsecureToo.value = !c.isObsecureToo.value;
                  },
                  child: Icon(
                    c.isObsecureToo.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Dimensions.lightGreyColor,
                  ))),
              hintText: "Confirm Password...",
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
                  horizontal: Dimensions.width20,
                  vertical: Dimensions.height15),
              fillColor: Dimensions.blackColor,
              filled: true),
        ),
      ),
    );
  } //confirmPasswordWidget

  Obx passwordWidget() {
    return Obx(
      () => SizedBox(
        height: Dimensions.height35,
        child: TextFormField(
          // controller: titleController,
          validator: passwordValidator,
          controller: passwordController,
          keyboardType: TextInputType.text,
          obscureText: c.isObsecure.value,

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
                    c.isObsecure.value
                        ? Icons.visibility_off
                        : Icons.visibility,
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
                  horizontal: Dimensions.width20,
                  vertical: Dimensions.height15),
              fillColor: Dimensions.blackColor,
              filled: true),
        ),
      ),
    );
  } //passwordWidget

  dynamic stagenameValidator(String? value) {
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
  } //sStageNameValidator

  dynamic ageValidator(String? value) {
    if (value!.isEmpty) {
      return "Age Value is Required";
    } else if (value.length > 3) {
      return "Anyone above a 100 years is not allowed to register";
      // } else if (!stagenameRegExp.hasMatch(value)) {
      //   return "Invalid Stage Name";
    } else {
      return null;
    }
  } //ageValidator

  dynamic emailValidator(String? value) {
    RegExp emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (value!.isEmpty) {
      return 'Email Address value is required';
    } else if (value.length < 4) {
      return "Email Address value is too short";
    } else if (!emailRegExp.hasMatch(value)) {
      return "Invalid Email Address format";
    } else {
      return null;
    }
  }

  String? passwordValidator(String? value) {
    RegExp passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
    if (value!.isEmpty) {
      return "Password is Required";
    } else if (value.length < 8) {
      return "The Password is too short, it must be at least eight(8) characters";
    } else if (!value.contains(RegExp(r'[0-9]'))) {
      return "Password must contain at least one number";
    } else if (!value.contains(RegExp(r'[A-Z]'))) {
      return "Password must contain at least one Capital Letter";
    } else if (!value.contains(RegExp(r'[a-z]'))) {
      return "Password must contain at least one Small Letter";
    }
    // else if (!passwordRegExp.hasMatch(value)) {
    //   return "Invalid Password value";
    // }
    else {
      return null;
    }
  } //passwordValidator
}
