import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

showTransferDialog(BuildContext context) {


  return AlertDialog(
    title: Text(
      AppLocalizations.of(context)!.  transfer_dialog_title,
      textAlign: TextAlign.center,
    ),
    content: Text(AppLocalizations.of(context)!.transfer_dialog_message  ,
        textAlign: TextAlign.center),
    actionsAlignment: MainAxisAlignment.center,
    actions: [
      ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
        child: Text(AppLocalizations.of(context)!.yes_transfer_dialog,
            textAlign: TextAlign.center),
      ),
      ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
        child: Text(AppLocalizations.of(context)!.cancel_transfer_dialog,
            textAlign: TextAlign.center),
      ),
    ],
  );
}
