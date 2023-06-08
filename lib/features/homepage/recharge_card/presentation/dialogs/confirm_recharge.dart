import 'package:alwafeer/core/bloc/bloc/stepper_cubit.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

showConfirmRechargeDialog(
    BuildContext context, StepperCubit rechargeStepperCubit) {
  return AlertDialog(
    title: Text(
      AppLocalizations.of(context)!.confirm_purchasing_title_dialog,
      textAlign: TextAlign.center,
    ),
    content: Text(
        AppLocalizations.of(context)!.confirm_purchasing_subtitle_dialog,
        textAlign: TextAlign.center),
    actionsAlignment: MainAxisAlignment.center,
    actions: [
      ElevatedButton(
        onPressed: () {
          rechargeStepperCubit.nextStep();
          Navigator.pop(context);
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
        child: Text(
            AppLocalizations.of(context)!.confirm_purchasing_buy_btn_dialog,
            textAlign: TextAlign.center),
      ),
      ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
        child: Text(
            AppLocalizations.of(context)!.confirm_purchasing_cancel_btn_dialog,
            textAlign: TextAlign.center),
      ),
    ],
  );
}
