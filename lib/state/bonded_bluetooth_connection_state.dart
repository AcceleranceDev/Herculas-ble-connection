import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:herculas_bluetooth_connectivity/base/base_bloc/base_ui_state.dart';

class BoundedBluetoothConnectionState extends BaseUiState<BluetoothConnection> {
  BoundedBluetoothConnectionState.loading() : super.loading();

  BoundedBluetoothConnectionState.completed(BluetoothConnection data)
      : super.completed(data: data);

  BoundedBluetoothConnectionState.error(dynamic error) : super.error(error);
}
