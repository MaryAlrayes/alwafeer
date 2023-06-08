import 'package:alwafeer/features/homepage/common_presentation/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class Step2Item2 extends StatelessWidget {
  final String image;
  final Color c;
  final VoidCallback handler;
  const Step2Item2({
    super.key,
    required this.image,
    required this.c,
    required this.handler,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: handler,
      child: CustomeCard(
        c: c,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _buildImage(),
        ),
      ),
    );
  }

  Image _buildImage() {
    return Image.asset(
          image,
          fit: BoxFit.contain,
        );
  }
}
