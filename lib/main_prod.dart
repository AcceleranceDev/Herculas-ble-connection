import 'package:flutter/material.dart';
import 'package:herculas_bluetooth_connectivity/constant/global_variable_constant.dart';
import 'package:herculas_bluetooth_connectivity/route/route_manage.dart';
import 'package:herculas_bluetooth_connectivity/screens/ble_dashboard_screen.dart';
import 'package:herculas_bluetooth_connectivity/theme/app_theme.dart';

void start() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouteManager.onGenerateRoute,
      supportedLocales: GlobalVariableConstant.supportedLocale,
      title: 'Flutter Demo',
      theme: AppTheme.getTheme(),
      home: const BleDashboardScreen(),
    );
  }
}
