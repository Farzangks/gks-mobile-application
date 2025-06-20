import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ghar_ka_sathi/utils/colors_res.dart';
import 'package:pin_code_fields/pin_code_fields.dart';



Widget pinCodeTextFieldWidget(BuildContext context,
    {StreamController<ErrorAnimationType>? errorController,
    TextEditingController? controller,
    ValueChanged<String>? onChanged}) {
  return PinCodeTextField(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    appContext: context,
    pastedTextStyle: TextStyle(
        color:  AppColors.primaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 14),
    length: 6,
    obscureText: false,
    showCursor: false,
    animationType: AnimationType.fade,
    errorTextSpace: 30,
    validator: (v) {
      if (v!.length < 6) {
        return "Pin is not correct. Please try again";
      } else {
        return null;
      }
    },
    pinTheme: PinTheme(
      shape: PinCodeFieldShape.box,
      fieldHeight: 55,
      fieldWidth: 50,
      activeFillColor: AppColors.secondaryColor,
      inactiveFillColor: Colors.grey.shade200,
      selectedFillColor: AppColors.primaryColor,
      inactiveColor: Colors.white,
      selectedColor: AppColors.secondaryColor,
      borderRadius: const BorderRadius.all(Radius.circular(12)),
    ),
    animationDuration: const Duration(milliseconds: 300),
    textStyle: const TextStyle(
      fontSize: 20,
      height: 1.6,
      color: AppColors.appTextColorPrimary,
    ),
    backgroundColor: Colors.transparent,
    enableActiveFill: true,
    errorAnimationController: errorController,
    controller: controller,
    keyboardType: TextInputType.number,
    onCompleted: (v) {},
    onChanged: onChanged!,
    beforeTextPaste: (text) {
      return true;
    },
  );
}
