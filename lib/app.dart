import 'package:flutter/material.dart';
import 'package:herculas_bluetooth_connectivity/base/configuration/app_configuration.dart';
import 'package:herculas_bluetooth_connectivity/base/i18n/i18n_engine.dart';
import 'package:herculas_bluetooth_connectivity/bloc/bluetooth_bloc.dart';
import 'package:herculas_bluetooth_connectivity/constant/global_variable_constant.dart';
import 'package:herculas_bluetooth_connectivity/route/route_manage.dart';
import 'package:herculas_bluetooth_connectivity/screens/reset_bluetooth_command.dart';
import 'package:i18n_extension/i18n_widget.dart';

import 'theme/app_theme.dart';

class App {
  static void init(AppConfigurations appConfigurations) async {
    WidgetsFlutterBinding.ensureInitialized();
    await I18nEngine().init(appConfigurations.supportedLocales);
    runApp(const MyApp());
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
    BluetoothBloc().getDiscoveredBluetoothDevice();
    BluetoothBloc().getBoundedBluetoothDevices();
  }

  @override
  Widget build(BuildContext context) {
    return I18n(
      child: MaterialApp(
        onGenerateRoute: RouteManager.onGenerateRoute,
        supportedLocales: GlobalVariableConstant.supportedLocale,
        title: 'Flutter Demo',
        theme: AppTheme.getTheme(),
        home: ResetBluetoothCommand(),
      ),
    );
  }
}
