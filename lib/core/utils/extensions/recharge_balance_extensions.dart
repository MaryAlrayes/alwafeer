import 'package:alwafeer/core/utils/enums/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
extension RechargeBalancePayMethod on RechargePayMethod {
  String displayText(BuildContext context) {
    switch (this) {
      case RechargePayMethod.visaCard:
        return   AppLocalizations.of(context)!.recharge_balance_visa_card;
      case RechargePayMethod.masterCard:
        return AppLocalizations.of(context)!.recharge_balance_master_card;
      case RechargePayMethod.payPal:
        return AppLocalizations.of(context)!.recharge_balance_paypal_card;
      case RechargePayMethod.contactWithDelegate:
        return AppLocalizations.of(context)!.recharge_balance_contact_delegate_card;
    }
  }
}
