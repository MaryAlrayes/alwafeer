
import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback handler;
  const SettingsItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.handler
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          foregroundColor: Colors.black,
          side: const BorderSide(width: 1.0, color: Colors.grey),
          padding: const EdgeInsets.all(20)),
      onPressed: handler,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(title), Icon(icon)],
      ),
    );
  }
}
