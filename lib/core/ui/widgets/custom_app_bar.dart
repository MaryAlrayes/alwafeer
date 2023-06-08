
import 'package:flutter/material.dart';

import '../../utils/constants/assets_path.dart';
import '../dialogs/logout_dialog.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          color: Colors.black,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                AssetsPath.LOGO_APPBAR,
                fit: BoxFit.fitHeight,
                width: 100,
                color: Colors.amber,
                alignment: Alignment.centerLeft,
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => showLogOutDialog(context),
                  );
                },
                icon: const Icon(Icons.logout, color: Colors.white),
              )
            ],
          ),
        ),
      ],
    );
  }
}
