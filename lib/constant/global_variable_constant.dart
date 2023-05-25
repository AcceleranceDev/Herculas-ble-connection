import 'dart:ui';

import 'package:herculas_bluetooth_connectivity/model/reset_bluetooth_utiliy.dart';

class GlobalVariableConstant {
  static const List<Locale> supportedLocale = [
    Locale('en', "US"),
  ];

  static List<ResetBlueToothUtility> bluetoothRangeConstant() => [
        ResetBlueToothUtility(
          name: "Range",
          setButtonLabel: "Set Range",
          getButtonLabel: "Get Range",
          setValueLabel: "Set Value",
        ),
        ResetBlueToothUtility(
          name: "Database",
          setButtonLabel: "Set DB",
          getButtonLabel: "Get DB",
          setValueLabel: "Set Value",
        ),
        ResetBlueToothUtility(
          name: "Dev Info",
          setButtonLabel: "Set Device",
          getButtonLabel: "Get Device",
          setValueLabel: "Set Value",
        ),
        ResetBlueToothUtility(
          name: "Sync RTC",
          setButtonLabel: "Set RTC",
          getButtonLabel: "Get RTC",
          setValueLabel: "Set Value",
        ),
        ResetBlueToothUtility(
          name: "Rid",
          setButtonLabel: "Set RID",
          getButtonLabel: "Get RID",
          setValueLabel: "Set Value",
        ),
        ResetBlueToothUtility(
          name: "Blesig",
          setButtonLabel: "Set Blesig",
          getButtonLabel: "Get Blesig",
          setValueLabel: "Set Value",
        ),
      ];
}
