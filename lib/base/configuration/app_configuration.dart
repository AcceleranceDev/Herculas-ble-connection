import 'package:flutter/material.dart';
import 'package:herculas_bluetooth_connectivity/base/configuration/api_configuration.dart';

class AppConfigurations {
  List<Locale>? _supportedLocales;
  ApiConfigurations apiConfigurations;

  AppConfigurations({
    List<Locale>? supportedLocales,
    required this.apiConfigurations,
  }) {
    _supportedLocales = supportedLocales;
  }

  List<Locale> get supportedLocales =>
      _supportedLocales ??
      <Locale>[
        const Locale('en'),
      ];
}
