import 'package:alwafeer/core/utils/enums/recharge_enum.dart';
import 'package:alwafeer/features/homepage/recharge_card/presentation/screens/recharge_screen.dart';
import 'package:flutter/material.dart';


class RechargePrintScreen extends StatelessWidget {
  static const routeName = "recharge_print_screen";

  const RechargePrintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const RechargeScreen(rechargeOption: RechargeOption.print,);
  }

}
