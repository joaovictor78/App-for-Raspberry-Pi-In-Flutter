import 'package:flutter/material.dart';
import 'package:remote_control/ui/pages/remote_control_page.dart';
import 'ui/pages/select_bonded_device_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => SelectBondedDevicePage(),
        '/remote-control': (context) => RemoteControlPage(
            deviceAddress: ModalRoute.of(context)!.settings.arguments as String)
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
