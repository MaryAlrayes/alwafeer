
import 'package:flutter/material.dart';

import '../../../core/utils/constants/assets_path.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return  Image.asset(
      AssetsPath.LOGIN_ICON,
      fit: BoxFit.cover,
      alignment: Alignment.center,
      height: 230,
      width: 223,
    );
  }
}
