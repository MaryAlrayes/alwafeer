import 'package:flutter/material.dart';

class CustomeCard extends StatelessWidget {
  final Color c;
  final Widget child;
  const CustomeCard({super.key, required this.child, required this.c});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: c,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: c,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.amber, width: 2),
          ),
          height: 130,
          width: MediaQuery.of(context).size.width,
          child: child),
    );
  }
}
