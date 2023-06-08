// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class NextBtn extends StatelessWidget {
  final VoidCallback handler;
  const NextBtn({
    Key? key,
    required this.handler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: handler,
      child: const CircleAvatar(
        backgroundColor: Colors.purple,
        child: Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
      ),
    );
  }
}
