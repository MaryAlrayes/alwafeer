import 'package:flutter/material.dart';

import 'custom_card.dart';


class Step1Item1 extends StatelessWidget {
  final Color backgroundColor;
  final String image;
  final String title;
  final VoidCallback handler;
  const Step1Item1({
    super.key,
    required this.backgroundColor,
    required this.image,
    required this.handler,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: handler,
      child: CustomeCard(
        c: backgroundColor,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: GridTile(
            footer: _buildFooter(),
            child: _buildImage(),
          ),
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

  GridTileBar _buildFooter() {
    return GridTileBar(
            backgroundColor: Colors.black.withOpacity(0.3),
            title: Container(
              padding: const EdgeInsets.all(8),
              child: Text(
                title,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          );
  }
}
