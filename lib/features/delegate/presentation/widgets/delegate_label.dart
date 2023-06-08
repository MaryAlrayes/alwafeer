import 'package:flutter/material.dart';

class DelegateLabel extends StatelessWidget {
  final String label;
  const DelegateLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
          fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
    );
    ;
  }
}
