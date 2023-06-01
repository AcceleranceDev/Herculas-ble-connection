import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:rxdart/rxdart.dart';

class BluetoothRepo {
  final _bluetoothConnection = FlutterBluetoothSerial.instance;

  Stream<List<BluetoothDevice>> discoveredBluetoothDevice() {
    final result = BehaviorSubject<List<BluetoothDevice>>();
    List<BluetoothDevice> devices = [];
    _bluetoothConnection.startDiscovery().listen((event) {
      devices.add(event.device);
    });
    result.add(devices);
    return result;
  }

  Stream<List<BluetoothDevice>> getBondedBluetoothDevices() {
    return Stream.fromFuture(_bluetoothConnection.getBondedDevices());
  }

  Stream<BluetoothConnection> connectToNearByDevice({required String address}) {
    return Stream.fromFuture(BluetoothConnection.toAddress(address));
  }

  Stream<bool?> removeBondedBluetoothDevice({required String address}) {
    return Stream.fromFuture(
        _bluetoothConnection.removeDeviceBondWithAddress(address));
  }

  Stream<bool?> bondNewBluetoothDevice({required String address}) {
    return Stream.fromFuture(_bluetoothConnection.bondDeviceAtAddress(address));
  }
}
