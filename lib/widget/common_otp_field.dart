import 'package:flutter/material.dart';
import 'package:herculas_bluetooth_connectivity/constant/color_constant.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CommonOtpField extends StatelessWidget {
  final int length;
  final Function(String) onChange;
  final Function(String) onComplete;
  final String? Function(String?)? validator;
  final TextEditingController controller;

  const CommonOtpField(
      {Key? key,
      this.length = 6,
      required this.controller,
      required this.onChange,
      this.validator,
      required this.onComplete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      mainAxisAlignment: MainAxisAlignment.center,
      appContext: context,
      length: length,
      blinkWhenObscuring: true,
      autoDismissKeyboard: true,
      animationType: AnimationType.fade,
      validator: validator,
      pinTheme: PinTheme(
        fieldOuterPadding: const EdgeInsets.symmetric(horizontal: 4),
        shape: PinCodeFieldShape.circle,
        fieldHeight: 50,
        fieldWidth: 50,
        activeFillColor: ColorConst.appBarColor,
        activeColor: ColorConst.appBarColor,
        selectedColor: ColorConst.buttonColor,
        disabledColor: Colors.white,
        inactiveColor: ColorConst.appBarColor,
        selectedFillColor: ColorConst.buttonColor,
        inactiveFillColor: ColorConst.appBarColor,
      ),
      cursorColor: ColorConst.buttonColor,
      errorTextMargin: const EdgeInsets.only(
        left: 57,
      ),
      enabled: true,
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: false,
      controller: controller,
      keyboardType: TextInputType.number,
      onCompleted: onComplete,
      onChanged: onChange,
    );
  }
}
