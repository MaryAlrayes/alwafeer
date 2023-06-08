import 'package:alwafeer/core/utils/enums/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension NotificationFilterTypeExtension on NotificationFilterType {
  String displayText(BuildContext context) {
    switch (this) {
      case NotificationFilterType.all:
        return AppLocalizations.of(context)!.all_notification_filter;

      case NotificationFilterType.pay:
        return AppLocalizations.of(context)!.pay_filter;

      case NotificationFilterType.charge:
        return AppLocalizations.of(context)!.charge_filter;
    }
  }
}
