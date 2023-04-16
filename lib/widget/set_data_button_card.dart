import 'package:flutter/material.dart';
import 'package:herculas_bluetooth_connectivity/constant/color_constant.dart';
import 'package:herculas_bluetooth_connectivity/constant/font_family_constant.dart';

class SetDataButtonCard extends StatelessWidget {
  const SetDataButtonCard({
    Key? key,
    required this.label,
    required this.buttonText,
    required this.value,
    required this.decrementedRange,
    required this.incrementedRange,
    required this.setRange,
  }) : super(key: key);
  final String label;
  final String buttonText;
  final String value;
  final VoidCallback setRange;
  final Function(String) incrementedRange;
  final Function(String) decrementedRange;

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
              Container(
                width: MediaQuery.of(context).size.width * .3,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: ColorConst.dashboardCardColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => incrementedRange.call(value),
                      child: Container(
                        height: 33,
                        width: 33,
                        decoration: BoxDecoration(
                          color: ColorConst.buttonColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.add),
                      ),
                    ),
                    Text(
                      value,
                      style: const TextStyle(
                        color: ColorConst.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => decrementedRange.call(value),
                      child: Container(
                        height: 33,
                        width: 33,
                        decoration: BoxDecoration(
                          color: ColorConst.buttonColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.exposure_minus_1),
                      ),
                    ),
                  ],
                ),
              ),
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
