import 'package:remote_control/models/device_model.dart';
import '../services/bluetooth_service.dart';

class SelectBoundedDevicesController {
  final BluetoothService _service;
  SelectBoundedDevicesController(this._service);

  Future<List<DeviceModel>> getBoundedDevices() async {
    final devices = await _service.getBoundedDevices();
    return devices;
  }
}
