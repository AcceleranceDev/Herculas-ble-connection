import 'package:flutter/material.dart';
import 'package:herculas_bluetooth_connectivity/route/route_constant.dart';
import 'package:herculas_bluetooth_connectivity/screens/database_screen.dart';
import 'package:herculas_bluetooth_connectivity/screens/dev_info_screen.dart';
import 'package:herculas_bluetooth_connectivity/screens/range_screen.dart';
import 'package:herculas_bluetooth_connectivity/screens/syn_rtc_screen.dart';

class RouteManager {
  static PageRoute onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstant.rangeScreen:
        return MaterialPageRoute(
          builder: (context) => const RangeScreen(),
        );
      case RouteConstant.databaseScreen:
        return MaterialPageRoute(
          builder: (context) => const DatabaseScreen(),
        );
      case RouteConstant.devInfo:
        return MaterialPageRoute(
          builder: (context) => const DevInfoScreen(),
        );
      case RouteConstant.synRTC:
        return MaterialPageRoute(
          builder: (context) => const SyncRtcScreen(),
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
