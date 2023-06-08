import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ChargeNotification extends StatelessWidget {
  final double amount;
  final DateTime date;
  const ChargeNotification(
      {super.key, required this.amount, required this.date});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          contentPadding: const EdgeInsets.all(4),
          title:  Text(AppLocalizations.of(context)!.notification_charge),
          subtitle: Text(AppLocalizations.of(context)!.notification_date(date)),
          trailing: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
          AppLocalizations.of(context)!.plus_amount(amount),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
