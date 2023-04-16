import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:herculas_bluetooth_connectivity/constant/color_constant.dart';
import 'package:herculas_bluetooth_connectivity/constant/font_family_constant.dart';
import 'package:herculas_bluetooth_connectivity/constant/global_variable_constant.dart';

class HistorySession extends StatelessWidget {
  const HistorySession({Key? key, this.isHistorySession = false, required this.onChanges})
      : super(key: key);
  final bool isHistorySession;
  final Function(bool) onChanges;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(
              child: Text(
                "View History",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  fontFamily: FontConstant.timNewRoman,
                ),
              ),
            ),
            Transform.scale(
              scale: 1.1,
              child: CupertinoSwitch(
                trackColor: ColorConst.dashboardCardColor,
                activeColor: ColorConst.historySwitchColor,
                thumbColor: isHistorySession ? ColorConst.buttonColor : ColorConst.scaffoldColor,
                value: isHistorySession,
                onChanged: (val) => onChanges.call(val),
              ),
            )
          ],
        ),
        const SizedBox(height: 18),
        if (isHistorySession)
          Container(
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: ColorConst.dashboardCardColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: GlobalVariableConstant.bluetoothRangeConstant.length,
              itemBuilder: (context, index) => _HistoryTile(
                label: GlobalVariableConstant.bluetoothRangeConstant[index],
                onTap: (value) {
                  print(value);
                },
              ),
            ),
          )
      ],
    );
  }
}

class _HistoryTile extends StatelessWidget {
  const _HistoryTile({Key? key, required this.label, required this.onTap}) : super(key: key);
  final String label;
  final Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap.call(label),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: ColorConst.scaffoldColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
                color: ColorConst.buttonColor,
                fontFamily: FontConstant.timNewRoman,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
