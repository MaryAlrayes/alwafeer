import 'package:alwafeer/core/utils/constants/assets_path.dart';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            padding: const EdgeInsets.all(0),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  AssetsPath.BACKGROUND_IMAGE,
                ),
                repeat: ImageRepeat.repeat,
                scale: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
