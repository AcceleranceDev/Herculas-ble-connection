import 'package:flutter/cupertino.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:herculas_bluetooth_connectivity/base/base_bloc/base_bloc.dart';
import 'package:herculas_bluetooth_connectivity/repo/bluetooth_repo.dart';
import 'package:herculas_bluetooth_connectivity/state/bonded_bluetooth_connection_state.dart';
import 'package:herculas_bluetooth_connectivity/state/bonded_bluetooth_state.dart';
import 'package:herculas_bluetooth_connectivity/state/discovered_bluetooth_state.dart';
import 'package:herculas_bluetooth_connectivity/utils/dialog_utils.dart';
import 'package:rxdart/rxdart.dart';

class BluetoothBloc extends BaseBloc {
  final discoveredBluetoothState = BehaviorSubject<DiscoveredBluetoothState>();
  final boundedBluetoothState = BehaviorSubject<BondedBluetoothState>();
  final boundedBluetoothConnectionState =
      BehaviorSubject<BoundedBluetoothConnectionState>();
  final _bluetoothRepo = BluetoothRepo();

  void getAllBluetoothDevices(BuildContext context) {
    subscriptions.add(_bluetoothRepo.isBluetoothOn().listen((event) {
      if (event == BluetoothState.on) {
        _getDiscoveredBluetoothDevice();
        _getBondedBluetoothDevices();
      }
      if (event == BluetoothState.off) {
        _bluetoothRepo.turnOnBluetooth();
      }
    }));
  }

  void _getDiscoveredBluetoothDevice() {
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

  void _getBondedBluetoothDevices() {
    subscriptions.add(
      _bluetoothRepo
          .getBondedBluetoothDevices()
          .map((data) => BondedBluetoothState.completed(data))
          .startWith(BondedBluetoothState.loading())
          .onErrorReturnWith(
              (error, stackTrace) => BondedBluetoothState.error(error))
          .listen((state) {
        print("Bounded Bluetooth");
        print(state.data);
        boundedBluetoothState.add(state);
      }),
    );
  }

  void connectToBondedDevice({
    required BluetoothDevice device,
    required BuildContext context,
  }) {
    subscriptions.add(
      _bluetoothRepo
          .connectToNearByDevice(device: device)
          .map((data) => BoundedBluetoothConnectionState.completed())
          .startWith(BoundedBluetoothConnectionState.loading())
          .onErrorReturnWith((error, stackTrace) =>
              BoundedBluetoothConnectionState.error(error))
          .listen((state) {
        if (state.isLoading()) {
          DialogUtils.showLoader(context);
        }
        if (state.isError()) {
          DialogUtils.hideLoader(context);
          print("Error to connect bounded device-- ${state.error}");
        }
        boundedBluetoothConnectionState.add(state);
      }),
    );
  }

  void connectToNewDevice({
    required BluetoothDevice device,
    required BuildContext context,
  }) {
    DialogUtils.showLoader(context);
    subscriptions.add(
      _bluetoothRepo.bondNewBluetoothDevice(device: device).listen(
        (event) {
          connectToBondedDevice(device: device, context: context);
        },
      ),
    );
  }

  void removeBondedBluetoothDevice({
    required BluetoothDevice device,
    required BuildContext context,
  }) {
    DialogUtils.showLoader(context);
    subscriptions.add(
      _bluetoothRepo.removeBondedBluetoothDevice(device: device).listen(
        (event) {
          DialogUtils.hideLoader(context);
          if (event == true) {
            _getBondedBluetoothDevices();
          }
          print("Unbound bluetooth status--- $event");
        },
      ),
    );
  }
}
