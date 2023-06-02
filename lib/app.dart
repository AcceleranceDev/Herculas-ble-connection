import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:herculas_bluetooth_connectivity/base/configuration/app_configuration.dart';
import 'package:herculas_bluetooth_connectivity/base/i18n/i18n_engine.dart';
import 'package:herculas_bluetooth_connectivity/constant/global_variable_constant.dart';
import 'package:herculas_bluetooth_connectivity/route/route_manage.dart';
import 'package:herculas_bluetooth_connectivity/screens/home_screen.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:permission_handler/permission_handler.dart';

import 'theme/app_theme.dart';

class App {
  static void init(AppConfigurations appConfigurations) async {
    WidgetsFlutterBinding.ensureInitialized();
    await I18nEngine().init(appConfigurations.supportedLocales);
    final isBleOn = await FlutterBluePlus.instance.isOn;
    if (!isBleOn) {
      await FlutterBluePlus.instance.turnOn();
    }
    await [
      Permission.location,
      Permission.storage,
      Permission.bluetooth,
      Permission.bluetoothConnect,
      Permission.bluetoothScan
    ].request().then((status) {
      runApp(const MyApp());
    });
  }
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
    return I18n(
      child: MaterialApp(
        onGenerateRoute: RouteManager.onGenerateRoute,
        supportedLocales: GlobalVariableConstant.supportedLocale,
        title: 'Flutter Demo',
        theme: AppTheme.getTheme(),
        home: HomeScreen(),
      ),
    );
  }
}
