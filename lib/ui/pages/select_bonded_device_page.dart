import 'package:flutter/material.dart';
import 'package:remote_control/models/device_model.dart';
import 'package:remote_control/services/bluetooth_service.dart';
import '../../controllers/select_bounded_devices_controller.dart';
import '../components/buetooth_device_component_available.dart';

class SelectBondedDevicePage extends StatefulWidget {
  const SelectBondedDevicePage({super.key});

  @override
  _SelectBondedDevicePage createState() => _SelectBondedDevicePage();
}

class _SelectBondedDevicePage extends State<SelectBondedDevicePage> {
  late SelectBoundedDevicesController controller;
  List<DeviceModel> devices = List<DeviceModel>.empty(growable: true);
  @override
  void initState() {
    controller = SelectBoundedDevicesController(BluetoothService());
    controller.getBoundedDevices().then((value) {
      setState(() {
        devices = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<BluetoothDeviceListEntry> list = devices
        .map((device) => BluetoothDeviceListEntry(
              address: device.address ?? '',
              deviceName: device.deviceName ?? '',
              onTap: () {
                Navigator.of(context).popAndPushNamed('/remote-control',
                    arguments: device.address);
              },
            ))
        .toList();
    return Scaffold(
      backgroundColor: const Color(0xFF141414),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Select device'),
      ),
      body: RefreshIndicator(
          onRefresh: () async {
            devices = await controller.getBoundedDevices();
            setState(() {});
          },
          child: ListView(children: list)),
    );
  }
}
