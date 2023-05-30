import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:herculas_bluetooth_connectivity/base/base_bloc/base_ui_state.dart';

class DiscoveredBluetoothState extends BaseUiState<List<BluetoothDevice>> {
  DiscoveredBluetoothState.loading() : super.loading();

  DiscoveredBluetoothState.completed(List<BluetoothDevice> data)
      : super.completed(data: data);

  DiscoveredBluetoothState.error(dynamic error) : super.error(error);
}
