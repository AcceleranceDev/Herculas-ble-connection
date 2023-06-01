import 'package:flutter/material.dart';
import 'package:herculas_bluetooth_connectivity/constant/image_constant.dart';
import 'package:herculas_bluetooth_connectivity/theme/app_text_style.dart';

class BluetoothHistory extends StatelessWidget {
  const BluetoothHistory({
    Key? key,
    this.name,
    this.onUnpairClick,
  }) : super(key: key);
  final String? name;
  final VoidCallback? onUnpairClick;
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
                name ?? "No Name",
                style: AppTextStyle.subtitle,
              ),
            ),
            if (onUnpairClick != null)
              IconButton(
                onPressed: onUnpairClick,
                icon: const Icon(
                  Icons.remove_circle_outline,
                  size: 35,
                ),
              )
          ],
        ),
      ),
    );
  }
}
