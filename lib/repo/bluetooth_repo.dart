import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:rxdart/rxdart.dart';

class BluetoothRepo {
  final bluetoothConnection = FlutterBluetoothSerial.instance;
  Stream<List<BluetoothDevice>> discoveredBluetoothDevice() {
    final result = BehaviorSubject<List<BluetoothDevice>>();
    List<BluetoothDevice> devices = [];
    bluetoothConnection.startDiscovery().listen((event) {
      devices.add(event.device);
    });
    result.add(devices);
    return result;
  }

  Stream<List<BluetoothDevice>> getBondedBluetoothDevices() {
    return Stream.fromFuture(bluetoothConnection.getBondedDevices());
  }
}
