import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:herculas_bluetooth_connectivity/base/base_bloc/base_ui_state.dart';

class BondedBluetoothState extends BaseUiState<List<BluetoothDevice>> {
  BondedBluetoothState.loading() : super.loading();

  BondedBluetoothState.completed(List<BluetoothDevice> data)
      : super.completed(data: data);

  BondedBluetoothState.error(dynamic error) : super.error(error);
}
