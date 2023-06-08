import 'package:flutter/material.dart';

class CustomFormLabel extends StatelessWidget {
  final String title;
  const CustomFormLabel({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.purple,
      ),
    );
  }
}
