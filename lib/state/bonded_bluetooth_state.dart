import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:herculas_bluetooth_connectivity/base/base_bloc/base_ui_state.dart';

class BoundedBluetoothState extends BaseUiState<List<BluetoothDevice>> {
  BoundedBluetoothState.loading() : super.loading();

  BoundedBluetoothState.completed(List<BluetoothDevice> data)
      : super.completed(data: data);

  BoundedBluetoothState.error(dynamic error) : super.error(error);
}
