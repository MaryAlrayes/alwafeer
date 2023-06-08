import 'package:alwafeer/core/utils/enums/recharge_enum.dart';
import 'package:alwafeer/features/homepage/recharge_card/presentation/screens/recharge_screen.dart';
import 'package:flutter/material.dart';

class RechargeShippingScreen extends StatelessWidget {
  static const routeName = "recharge_shipping_screen";
  const RechargeShippingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const RechargeScreen(rechargeOption: RechargeOption.shipping);
  }
}
