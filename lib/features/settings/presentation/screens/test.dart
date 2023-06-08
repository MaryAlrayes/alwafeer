// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  final Uint8List capturedImage;
  const Test({
    Key? key,
    required this.capturedImage,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  Container(
        color: Colors.red,
        child: Image.memory(
                capturedImage,
              ),
      ),
    );
  }
}
