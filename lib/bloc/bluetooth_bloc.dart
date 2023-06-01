import 'package:flutter/cupertino.dart';
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

  void getBondedBluetoothDevices() {
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
    required String address,
    required BuildContext context,
  }) {
    subscriptions.add(
      _bluetoothRepo
          .connectToNearByDevice(address: address)
          .map((data) => BoundedBluetoothConnectionState.completed(data))
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
    required String address,
    required BuildContext context,
  }) {
    DialogUtils.showLoader(context);
    subscriptions.add(
      _bluetoothRepo.bondNewBluetoothDevice(address: address).listen(
        (event) {
          if (event == true) {
            connectToBondedDevice(address: address, context: context);
          } else {
            print("Error to pair new device");
            DialogUtils.hideLoader(context);
          }
        },
      ),
    );
  }

  void removeBondedBluetoothDevice({
    required String address,
    required BuildContext context,
  }) {
    DialogUtils.showLoader(context);
    subscriptions.add(
      _bluetoothRepo.removeBondedBluetoothDevice(address: address).listen(
        (event) {
          DialogUtils.hideLoader(context);
          if (event == true) {
            getBondedBluetoothDevices();
          }
          print("Unbound bluetooth status--- $event");
        },
      ),
    );
  }
}
