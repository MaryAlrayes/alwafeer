import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PayNotification extends StatelessWidget {
  final double amount;
  final DateTime date;

  const PayNotification({Key? key, required this.amount, required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          contentPadding: const EdgeInsets.all(4),
          title: Text(AppLocalizations.of(context)!.notification_pay),
          subtitle: Text(AppLocalizations.of(context)!.notification_date(date)),
          trailing: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              AppLocalizations.of(context)!.minus_amount(amount),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
