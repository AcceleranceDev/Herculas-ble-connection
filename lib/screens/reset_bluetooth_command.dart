import 'package:flutter/material.dart';
import 'package:herculas_bluetooth_connectivity/constant/color_constant.dart';
import 'package:herculas_bluetooth_connectivity/constant/global_variable_constant.dart';
import 'package:herculas_bluetooth_connectivity/constant/image_constant.dart';
import 'package:herculas_bluetooth_connectivity/theme/app_text_style.dart';
import 'package:herculas_bluetooth_connectivity/widget/set_data_button_card.dart';

class ResetBluetoothCommand extends StatelessWidget {
  const ResetBluetoothCommand({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConst.appBarColor,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        children: [
          Image.asset(
            ImageConstant.meeting,
            height: 247,
            width: double.infinity,
          ),
          const SizedBox(height: 15),
          ...GlobalVariableConstant.bluetoothRangeConstant()
              .map(
                (e) => Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: ColorConst.appBarColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ExpansionTile(
                    maintainState: true,
                    controlAffinity: ListTileControlAffinity.platform,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          e.name,
                          style: AppTextStyle.header1.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          e.setValueLabel,
                          style: AppTextStyle.header1.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    children: [
                      SetDataButtonCard(
                        setValue: "0",
                        getValue: "0",
                        getValueButtonText: e.getButtonLabel,
                        setValueButtonText: e.setButtonLabel,
                        decrementedValue: (p0) {
                          print("Decremented");
                        },
                        incrementedValue: (p0) {
                          print("Incremented");
                        },
                        onSetClick: () {
                          print("OnSet Called");
                        },
                        onGetClick: () {
                          print("onGet Called");
                        },
                      )
                    ],
                  ),
                ),
              )
              .toList()
        ],
      ),
    );
  }
}