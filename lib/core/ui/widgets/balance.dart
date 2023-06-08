import 'package:alwafeer/features/recharge_balance/presentation/screens/recharge_balance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Balance extends StatelessWidget {
  const Balance({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextButton.icon(
        style: _buildStyle(),
        onPressed: () {
          Navigator.pushNamed(context, RechargeBalance.routeName);
        },
        icon: const Icon(Icons.add_circle_outline),
        label: _buildLabel(context),
      ),
    );
  }

  Row _buildLabel(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          AppLocalizations.of(context)!.balance(19.50),
          style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
        )
      ],
    );
  }

  ButtonStyle _buildStyle() {
    return ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsets>(
          const EdgeInsets.all(2).copyWith(left: 35, right: 35)),
      foregroundColor:
          MaterialStateProperty.resolveWith((state) => Colors.white),
      backgroundColor: MaterialStateProperty.all(Colors.purple),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }
}
