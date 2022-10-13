import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:remote_control/models/device_model.dart';

class BluetoothService {
  Future<List<DeviceModel>> getBoundedDevices() async {
    final List<BluetoothDevice> boundedDevices =
        await FlutterBluetoothSerial.instance.getBondedDevices();
    return boundedDevices
        .map((device) =>
            DeviceModel(address: device.address, deviceName: device.name))
        .toList();
  }
}
