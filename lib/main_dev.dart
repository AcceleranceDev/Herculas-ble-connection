import 'package:herculas_bluetooth_connectivity/base/configuration/api_configuration.dart';
import 'package:herculas_bluetooth_connectivity/base/configuration/app_configuration.dart';
import 'package:herculas_bluetooth_connectivity/base/main_base.dart';

void main() {
  start(
    AppConfigurations(
      apiConfigurations: ApiConfigurations(
        baseUrl: "Development API Base URL", // Will Add development base URL
      ),
    ),
  );
}
