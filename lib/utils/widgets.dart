import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freestyle/controller/boarding_controller.dart';
import 'package:freestyle/utils/dimensions.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class PageWidget {
  final BoardingController boardingController = Get.put(BoardingController());

  static textFormFieldWidget(
      {required String valLabel,
      required String hintText,
      required IconData prefixIcon,
      // required Color prefixColor,
      required Color borderColor,
      required Color fillColor,
      required Color textColor,
      TextInputType? textInput,
      TextEditingController? controller,
      Function(String?)? validator,
      required bool isObsecure}) {
    return TextFormField(
      // controller: titleController,
      validator: (String? value) => validator!(value),
      controller: controller,
      obscureText: isObsecure,
      keyboardType: textInput,
      style: TextStyle(fontSize: Dimensions.height10, color: textColor),
      decoration: InputDecoration(
          labelText: hintText,
          labelStyle:
              TextStyle(color: textColor, fontSize: Dimensions.height10),
          prefixIcon: Icon(
            prefixIcon,
            color: textColor,
          ),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.height25),
            borderSide: BorderSide(color: borderColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.height5),
            borderSide: BorderSide(color: borderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.height5),
            borderSide: BorderSide(color: borderColor),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.height5),
            borderSide: BorderSide(color: borderColor),
          ),
          contentPadding: EdgeInsets.symmetric(
              horizontal: Dimensions.width20, vertical: Dimensions.height30),
          fillColor: fillColor,
          filled: true),
    );
  }

  static materialButton(
      {required Color bgColor,
      required Function onPressed,
      required String buttonText,
      required Color textColor}) {
    return Material(
      color: bgColor,
      borderRadius: BorderRadius.circular(Dimensions.height15),
      child: InkWell(
        onTap: () => onPressed(),
        borderRadius: BorderRadius.circular(Dimensions.height20),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: Dimensions.height15, horizontal: Dimensions.width50),
          child: Text(
            buttonText,
            style: TextStyle(
                color: textColor,
                fontSize: Dimensions.height15,
                fontWeight: FontWeight.w800),
          ),
        ),
      ),
    );
  }

  static textWidget(
      {required String textLabel,
      required String fontFamily,
      required double fontSize,
      required FontWeight fontWeight,
      required Color textColor}) {
    return Text(
      textLabel,
      style: TextStyle(
          fontSize: fontSize,
          fontFamily: fontFamily,
          fontWeight: fontWeight,
          color: textColor),
    );
  }

  static dropdownWidget(
      {required List<String> items,
      required String title,
      required List<dynamic>  strings}) {
    return GFMultiSelect(
      items: items,
      onSelect: (value) {
        if (kDebugMode) {
          print('selected $value ');
          strings.add(value);
        }
      },
      dropdownTitleTileText: title,
      dropdownTitleTileColor: Dimensions.greyColor,
      dropdownTitleTileMargin: EdgeInsets.only(
          top: Dimensions.height5,
          left: Dimensions.width5,
          right: Dimensions.width5,
          bottom: Dimensions.height5),
      dropdownTitleTilePadding: EdgeInsets.all(Dimensions.height5),
      dropdownUnderlineBorder:
          BorderSide(color: Colors.transparent, width: Dimensions.width2),
      dropdownTitleTileBorder:
          Border.all(color: Dimensions.greyColor, width: Dimensions.width2),
      dropdownTitleTileBorderRadius: BorderRadius.circular(Dimensions.height5),
      expandedIcon: const Icon(
        Icons.keyboard_arrow_down,
        color: Dimensions.blackColor,
      ),
      collapsedIcon: const Icon(
        Icons.keyboard_arrow_up,
        color: Dimensions.blackColor,
      ),
      submitButton: const Text('OK'),
      dropdownTitleTileTextStyle: TextStyle(
          fontSize: Dimensions.height15, color: Dimensions.blackColor),
      padding: EdgeInsets.all(Dimensions.height5),
      margin: EdgeInsets.all(Dimensions.height5),
      type: GFCheckboxType.basic,
      activeBgColor: Dimensions.greenOpacityColor,
      inactiveBorderColor: Dimensions.greyColor,
    );
  }

// static dropdownWidget( {})
  //     {required String dropDownValue, required List<String> items}) {
  //   return Container(
  //     padding: EdgeInsets.symmetric(
  //         vertical: Dimensions.height2, horizontal: Dimensions.width50),
  //     child: DropdownButton(
  //       // Initial Value
  //       value: dropDownValue,
  //       // Down Arrow Icon
  //       icon: const Icon(Icons.keyboard_arrow_down),
  //
  //       // Array list of items
  //       items: items.map((String items) {
  //         return DropdownMenuItem(
  //           value: items,
  //           child: Text(items),
  //         );
  //       }).toList(),
  //       // After selecting the desired option,it will
  //       // change button value to selected value
  //       onChanged: (String? newValue) {
  //         dropDownValue = newValue!;
  //       },
  //     ),
  //   );
  // }

  static textFieldWidget(
      {required String valLabel,
      required String hintText,
      required IconData prefixIcon,
      // required Color prefixColor,
      required Color borderColor,
      required Color fillColor,
      required Color textColor,
      TextEditingController? controller,
      required bool isObsecure,
      int? maxLine}) {
    return TextField(
      // controller: titleController,
      onChanged: (val) => val == '' ? valLabel : null,
      style: TextStyle(fontSize: Dimensions.height10, color: textColor),
      obscureText: isObsecure == true ? true : false,
      maxLines: maxLine,
      controller: controller,
      decoration: InputDecoration(
          labelText: hintText,
          labelStyle:
              TextStyle(color: textColor, fontSize: Dimensions.height10),
          prefixIcon: Icon(
            prefixIcon,
            color: textColor,
          ),
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.height25),
            borderSide: BorderSide(color: borderColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.height5),
            borderSide: BorderSide(color: borderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.height5),
            borderSide: BorderSide(color: borderColor),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.height5),
            borderSide: BorderSide(color: borderColor),
          ),
          contentPadding: EdgeInsets.symmetric(
              horizontal: Dimensions.width20, vertical: Dimensions.height5),
          fillColor: fillColor,
          filled: true),
    );
  } //textFieldWidget

  static iconButtonWidget(
      {required Function onPressed,
      required Icon icon,
      required double iconSize,
      required Color color}) {
    return IconButton(
      onPressed: onPressed(),
      icon: icon,
      iconSize: iconSize,
      color: color,
    );
  } //iconButtonWidget

  static successSnackbarWidget({
    required String title,
    required String msg,
    required Icon icon,
  }) {
    return Get.snackbar(title, msg,
        icon: icon,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Dimensions.deepGreyColor,
        backgroundColor: Dimensions.whiteColor,
        duration: const Duration(seconds: 4),
        showProgressIndicator: true,
        progressIndicatorBackgroundColor: Dimensions.deepGreenColor,
        progressIndicatorValueColor:
            const AlwaysStoppedAnimation<Color>(Dimensions.lightGreenColor));
  } //successSnackbarWidget

  static errorSnackbarWidget({
    required String title,
    required String msg,
    required Icon icon,
  }) {
    return Get.snackbar(title, msg,
        icon: icon,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Dimensions.redColor,
        backgroundColor: Dimensions.whiteColor,
        duration: const Duration(seconds: 4),
        showProgressIndicator: true,
        progressIndicatorBackgroundColor: Dimensions.redColor,
        progressIndicatorValueColor:
            const AlwaysStoppedAnimation<Color>(Dimensions.lightRedColor));
  } //errorSnackbarWidget
}
