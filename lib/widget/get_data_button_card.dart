import 'package:flutter/material.dart';
import 'package:herculas_bluetooth_connectivity/constant/color_constant.dart';
import 'package:herculas_bluetooth_connectivity/constant/font_family_constant.dart';

class GetDataButtonCard extends StatelessWidget {
  const GetDataButtonCard({
    Key? key,
    required this.label,
    required this.buttonText,
    required this.value,
    required this.setRange,
  }) : super(key: key);
  final String label;
  final String buttonText;
  final String value;
  final VoidCallback setRange;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ColorConst.historySwitchColor, width: 2),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(110, 40),
                  backgroundColor: ColorConst.buttonColor,
                ),
                onPressed: () => setRange.call(),
                child: Text(
                  buttonText,
                  style: const TextStyle(
                    color: ColorConst.scaffoldColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    fontFamily: FontConstant.lato,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 50),
                child: Text(
                  value,
                  style: const TextStyle(
                    color: ColorConst.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    fontFamily: FontConstant.timNewRoman,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Text(
            label,
            style: const TextStyle(
              color: ColorConst.black,
              fontWeight: FontWeight.w400,
              fontSize: 15,
              fontFamily: FontConstant.timNewRoman,
            ),
          )
        ],
      ),
    );
  }
}
