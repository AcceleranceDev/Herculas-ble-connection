import 'package:flutter/material.dart';
import 'package:herculas_bluetooth_connectivity/constant/color_constant.dart';
import 'package:herculas_bluetooth_connectivity/constant/image_constant.dart';
import 'package:herculas_bluetooth_connectivity/route/route_constant.dart';
import 'package:herculas_bluetooth_connectivity/theme/app_text_style.dart';
import 'package:herculas_bluetooth_connectivity/widget/common_otp_field.dart';
import 'package:herculas_bluetooth_connectivity/widget/primary_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pinController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorConst.appBarColor,
      ),
      body: ListView(
        children: [
          _topCard(context),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(ImageConstant.eMark),
                Text(
                  'Confirm your PIN',
                  style: AppTextStyle.header2,
                ),
                const SizedBox(height: 25),
                CommonOtpField(
                  controller: pinController,
                  onChange: (v) {},
                  onComplete: (v) {},
                ),
                const SizedBox(height: 35),
                PrimaryButton(
                  label: "Sign In",
                  onPress: () {
                    Navigator.pushNamed(context, RouteConstant.homeScreen);
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _topCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: const BoxDecoration(
        color: ColorConst.appBarColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 9,
            spreadRadius: 3,
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Welcome!\nLet’s get started!',
              style: AppTextStyle.header1,
            ),
          ),
          Image.asset(
            ImageConstant.smile,
            height: 128,
            width: 156,
          )
        ],
      ),
    );
  }
}
