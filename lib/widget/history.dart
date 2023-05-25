import 'package:flutter/material.dart';
import 'package:herculas_bluetooth_connectivity/constant/image_constant.dart';
import 'package:herculas_bluetooth_connectivity/theme/app_text_style.dart';

class BluetoothHistory extends StatelessWidget {
  const BluetoothHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(
              ImageConstant.iphone,
              height: 38,
              width: 38,
            ),
            const SizedBox(width: 26),
            Expanded(
              child: Text(
                "Pixel 6A",
                style: AppTextStyle.subtitle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
