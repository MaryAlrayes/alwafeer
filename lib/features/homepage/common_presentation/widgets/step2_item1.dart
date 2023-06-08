import 'package:alwafeer/features/homepage/common_presentation/widgets/custom_card.dart';
import 'package:flutter/material.dart';


class Step2Item1 extends StatelessWidget {
  final Color c;
  final String image;
  final String text;
  final Color textColor;
  final VoidCallback handler;
  const Step2Item1(
      {super.key,
      required this.c,
      required this.image,
      required this.text,
      required this.textColor,
      required this.handler});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: handler,
      child: CustomeCard(
        c: c,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildImage(),
              _buildText(),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _buildText() {
    return Expanded(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: textColor,
                ),
              ),
            );
  }

  Expanded _buildImage() =>  Expanded(child: Image.asset(image),);
}
