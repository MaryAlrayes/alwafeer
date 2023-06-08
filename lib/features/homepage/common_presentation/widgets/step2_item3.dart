import 'package:alwafeer/features/homepage/common_presentation/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class Step2Item3 extends StatelessWidget {
  final String text;
  final String icon;
  final Color c;
  final VoidCallback handler;
  const Step2Item3({
    super.key,
    required this.text,
    required this.icon,
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
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(flex: 2, child: _buildText()),
              Expanded(flex: 1, child: _buildImage()),
            ],
          ),
        ),
      ),
    );
  }

  Text _buildText() => Text(
        text,
        textAlign: TextAlign.center,
       style:const TextStyle( fontSize:16),
      );

  Widget _buildImage() {
    return SizedBox(
      width: 40,
      height: 40,
      child: Image.asset(
        icon,
        fit: BoxFit.contain,

      ),
    );
  }
}
