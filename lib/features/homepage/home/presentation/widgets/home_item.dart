import 'package:flutter/material.dart';

class HomeItem extends StatelessWidget {
  final String title;
  final String image;
  final Function handler;
  const HomeItem(
      {Key? key,
      required this.title,
      required this.image,
      required this.handler})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xfff8d973),
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: () {
          handler();
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [_buildIcon(), _buildTitle()],
          ),
        ),
      ),
    );
  }

  Expanded _buildIcon() {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        child: Image.asset(
          image,
          height: 48,
          width: 48,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Expanded _buildTitle() {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        child: FittedBox(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
