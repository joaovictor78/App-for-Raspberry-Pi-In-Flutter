import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PowerButtonComponent extends StatelessWidget {
  final void Function()? onTap;
  bool isActive;
  PowerButtonComponent({super.key, this.onTap, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF1F1F1F),
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Icon(
            Icons.power_settings_new_outlined,
            color: isActive ? const Color(0xFF5FE82E) : const Color(0xFFF74E54),
            size: 40,
          ),
        ),
      ),
    );
  }
}
