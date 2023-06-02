import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:herculas_bluetooth_connectivity/base/base_bloc/base_ui_state.dart';

class DiscoveredBluetoothState extends BaseUiState<List<BluetoothDevice>> {
  DiscoveredBluetoothState.loading() : super.loading();

  DiscoveredBluetoothState.completed(List<BluetoothDevice> data)
      : super.completed(data: data);

  DiscoveredBluetoothState.error(dynamic error) : super.error(error);
}
