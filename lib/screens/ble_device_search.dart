import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:herculas_bluetooth_connectivity/constant/font_family_constant.dart';
import 'package:herculas_bluetooth_connectivity/constant/image_constant.dart';

class BleDeviceSearchScreen extends StatefulWidget {
  const BleDeviceSearchScreen({Key? key}) : super(key: key);

  @override
  State<BleDeviceSearchScreen> createState() => _BleDeviceSearchScreenState();
}

class _BleDeviceSearchScreenState extends State<BleDeviceSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                ImageConstant.arrowLeft,
              ),
              SvgPicture.asset(
                ImageConstant.screen1Bluetooth,
                height: 150,
                width: 200,
              ),
              const SizedBox(height: 55),
              SvgPicture.asset(
                ImageConstant.filledBluetooth,
                height: 150,
                width: 200,
              ),
              const SizedBox(
                height: 46,
              ),
              const Text(
                "Searching for devices",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                  fontFamily: FontConstant.inter,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
