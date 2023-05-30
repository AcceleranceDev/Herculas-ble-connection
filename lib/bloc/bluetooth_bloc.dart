import 'package:herculas_bluetooth_connectivity/base/base_bloc/base_bloc.dart';
import 'package:herculas_bluetooth_connectivity/repo/bluetooth_repo.dart';
import 'package:herculas_bluetooth_connectivity/state/bonded_bluetooth_state.dart';
import 'package:herculas_bluetooth_connectivity/state/discovered_bluetooth_state.dart';
import 'package:rxdart/rxdart.dart';

class BluetoothBloc extends BaseBloc {
  final discoveredBluetoothState = BehaviorSubject<DiscoveredBluetoothState>();
  final boundedBluetoothState = BehaviorSubject<BoundedBluetoothState>();
  final _bluetoothRepo = BluetoothRepo();

  void getDiscoveredBluetoothDevice() {
    subscriptions.add(
      _bluetoothRepo
          .discoveredBluetoothDevice()
          .map((event) => DiscoveredBluetoothState.completed(event))
          .startWith(DiscoveredBluetoothState.loading())
          .onErrorReturnWith(
              (error, stackTrace) => DiscoveredBluetoothState.error(error))
          .listen((event) {
            print("Discovered Bluetooth");
        print(event.data);
        discoveredBluetoothState.add(event);
      }),
    );
  }

  void getBoundedBluetoothDevices() {
    subscriptions.add(
      _bluetoothRepo
          .getBondedBluetoothDevices()
          .map((data) => BoundedBluetoothState.completed(data))
          .startWith(BoundedBluetoothState.loading())
          .onErrorReturnWith(
              (error, stackTrace) => BoundedBluetoothState.error(error))
          .listen((state) {
            print("Bounded Bluetooth");
            print(state.data);
        boundedBluetoothState.add(state);
      }),
    );
  }
}
