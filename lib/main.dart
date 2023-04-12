import 'package:flutter/material.dart';
import 'package:herculas_bluetooth_connectivity/screens/ble_device_search.dart';
import 'package:herculas_bluetooth_connectivity/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.getTheme(),
      home: const BleDeviceSearchScreen(),
    );
  }
}
