import 'package:flutter/material.dart';
import 'package:herculas_bluetooth_connectivity/constant/color_constant.dart';
import 'package:herculas_bluetooth_connectivity/theme/app_text_style.dart';
import 'package:herculas_bluetooth_connectivity/widget/primary_button.dart';

class SetDataButtonCard extends StatelessWidget {
  const SetDataButtonCard({
    Key? key,
    required this.setValueButtonText,
    required this.decrementedValue,
    required this.incrementedValue,
    required this.onSetClick,
    required this.onGetClick,
    required this.getValueButtonText,
    required this.getValue,
    required this.setValue,
  }) : super(key: key);
  final String setValueButtonText;
  final String getValueButtonText;
  final String setValue;
  final String getValue;
  final VoidCallback onSetClick;
  final VoidCallback onGetClick;
  final Function(String) incrementedValue;
  final Function(String) decrementedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // border: Border.all(color: ColorConst.historySwitchColor, width: 2),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .35,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: ColorConst.pitch,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => incrementedValue.call(setValueButtonText),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: ColorConst.buttonColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.add),
                      ),
                    ),
                    Text(
                      setValue,
                      style: AppTextStyle.header1.copyWith(fontSize: 15),
                    ),
                    GestureDetector(
                      onTap: () => decrementedValue.call(setValue),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        padding: const EdgeInsets.all(5),
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
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * .35,
                height: 42,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: ColorConst.pitch,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  getValue,
                  style: AppTextStyle.header1.copyWith(fontSize: 15),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: PrimaryButton(
                  height: 40,
                  label: setValueButtonText,
                  onPress: () => onSetClick.call(),
                ),
              ),
              const SizedBox(width: 40),
              Expanded(
                child: PrimaryButton(
                  height: 40,
                  label: getValueButtonText,
                  onPress: () => onGetClick.call(),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
