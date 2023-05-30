import 'package:flutter/material.dart';
import 'package:herculas_bluetooth_connectivity/route/route_constant.dart';
import 'package:herculas_bluetooth_connectivity/screens/home_screen.dart';
import 'package:herculas_bluetooth_connectivity/screens/reset_bluetooth_command.dart';

class RouteManager {
  static PageRoute onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstant.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case RouteConstant.resetCommand:
        return MaterialPageRoute(
          builder: (context) => const ResetBluetoothCommand(),
        );
    }
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text('404!!'),
        ),
      ),
    );
  }
}
