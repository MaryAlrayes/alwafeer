import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

showLogOutDialog(BuildContext context) {
  return AlertDialog(
    title: Text(
      AppLocalizations.of(context)!.log_out,
      textAlign: TextAlign.center,
    ),
    content: Text(AppLocalizations.of(context)!.log_out_confirm,
        textAlign: TextAlign.center),
    actionsAlignment: MainAxisAlignment.center,
    actions: [
      ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
        child: Text(AppLocalizations.of(context)!.yes_dialog,
            textAlign: TextAlign.center),
      ),
      ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
        child: Text(AppLocalizations.of(context)!.cancel_dialog,
            textAlign: TextAlign.center),
      ),
    ],
  );
}
