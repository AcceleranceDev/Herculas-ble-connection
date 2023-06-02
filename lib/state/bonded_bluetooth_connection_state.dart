import 'package:herculas_bluetooth_connectivity/base/base_bloc/base_ui_state.dart';

class BoundedBluetoothConnectionState extends BaseUiState {
  BoundedBluetoothConnectionState.loading() : super.loading();

  BoundedBluetoothConnectionState.completed() : super.completed();

  BoundedBluetoothConnectionState.error(dynamic error) : super.error(error);
}
