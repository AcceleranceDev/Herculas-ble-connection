import 'package:flutter/material.dart';
import 'package:herculas_bluetooth_connectivity/constant/color_constant.dart';
import 'package:herculas_bluetooth_connectivity/route/route_constant.dart';
import 'package:herculas_bluetooth_connectivity/theme/app_text_style.dart';
import 'package:herculas_bluetooth_connectivity/widget/history.dart';
import 'package:herculas_bluetooth_connectivity/widget/primary_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _ConnectedBluetooth();
  }
}

class _SearchingBluetooth extends StatelessWidget {
  const _SearchingBluetooth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sasy",
          style: AppTextStyle.header2,
        ),
        backgroundColor: ColorConst.appBarColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Searching for\ndevices',
                style: AppTextStyle.header1,
              ),
              const SizedBox(height: 10),
              Text(
                'Make sure your phone’s bluetooth device is unlocked',
                style: AppTextStyle.title,
              ),
              const SizedBox(height: 35),
              Container(
                padding: const EdgeInsets.all(70),
                decoration: const BoxDecoration(
                  color: ColorConst.buttonColor,
                  shape: BoxShape.circle,
                ),
              ),
              Text(
                "History",
                style: AppTextStyle.header1,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: ColorConst.appBarColor,
                      width: 3,
                    ),
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    children:
                        List.generate(16, (index) => const BluetoothHistory())
                            .toList(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _ConnectedBluetooth extends StatelessWidget {
  const _ConnectedBluetooth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConst.appBarColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Connected',
                style: AppTextStyle.header1,
              ),
              const SizedBox(height: 10),
              Text(
                "Let's get started!",
                style: AppTextStyle.title,
              ),
              const SizedBox(height: 28),
              Container(
                padding: const EdgeInsets.all(70),
                decoration: const BoxDecoration(
                  color: ColorConst.buttonColor,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(height: 28),
              PrimaryButton(
                label: "Click here to view details",
                style: AppTextStyle.title.copyWith(color: ColorConst.black),
                onPress: () {
                  Navigator.pushNamed(context, RouteConstant.resetCommand);
                },
              ),
              const SizedBox(height: 25),
              Text(
                "History",
                style: AppTextStyle.header1,
              ),
              const SizedBox(height: 5),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: ColorConst.appBarColor,
                      width: 3,
                    ),
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    children:
                        List.generate(16, (index) => const BluetoothHistory())
                            .toList(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
