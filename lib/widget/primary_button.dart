import 'package:flutter/material.dart';
import 'package:herculas_bluetooth_connectivity/constant/font_family_constant.dart';
import 'package:herculas_bluetooth_connectivity/theme/app_text_style.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPress;
  final double width;
  final double height;
  final TextStyle? style;
  const PrimaryButton({
    Key? key,
    required this.label,
    required this.onPress,
    this.width = double.infinity,
    this.height = 50,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        alignment: Alignment.center,
        elevation: 5,
        minimumSize: Size(width, height),
      ),
      onPressed: onPress,
      child: Text(
        label,
        style: style ??
            AppTextStyle.header2.copyWith(
              fontFamily: FontConstant.dmSans,
            ),
      ),
    );
  }
}
