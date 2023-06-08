import 'package:alwafeer/core/utils/enums/recharge_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension ZainTypeExtension on ZainType {
  String displayAbbreviation(BuildContext context) {
    switch (this) {
      case ZainType.GSIM:
        return AppLocalizations.of(context)!.zain_GSIM_abbrv;

      case ZainType.MIX:
        return AppLocalizations.of(context)!.zain_MIX_abbrv;

      case ZainType.DATA:
        return AppLocalizations.of(context)!.zain_DATA_abbrv;
    }
  }

  String displayText(BuildContext context) {
    switch (this) {
      case ZainType.GSIM:
        return AppLocalizations.of(context)!.zain_GSIM_text;

      case ZainType.MIX:
        return AppLocalizations.of(context)!.zain_MIX_text;

      case ZainType.DATA:
        return AppLocalizations.of(context)!.zain_DATA_text;
    }
  }
}

extension OrangeTypeExtension on OrangeType {
  String displayAbbreviation(BuildContext context) {
    switch (this) {
      case OrangeType.GSM:
        return AppLocalizations.of(context)!.orange_GSM_abbrv;

      case OrangeType.NOS_B_NOS:
        return AppLocalizations.of(context)!.orange_NOS_B_NOS_abbrv;

      case OrangeType.DATA:
        return AppLocalizations.of(context)!.orange_DATA_abbrv;

      case OrangeType.WEENAK:
        return AppLocalizations.of(context)!.orange_WEENAK_abbrv;
    }
  }

  String displayText(BuildContext context) {
    switch (this) {
      case OrangeType.GSM:
        return AppLocalizations.of(context)!.orange_GSM_text;

      case OrangeType.NOS_B_NOS:
        return AppLocalizations.of(context)!.orange_NOS_B_NOS_text;

      case OrangeType.DATA:
        return AppLocalizations.of(context)!.orange_DATA_text;

      case OrangeType.WEENAK:
        return AppLocalizations.of(context)!.orange_WEENAK_text;
    }
  }
}

extension UmniahExtension on UmniahType {
  String displayAbbreviation(BuildContext context) {
    switch (this) {
      case UmniahType.GSM:
        return AppLocalizations.of(context)!.umniah_GSM_abbrv;
      case UmniahType.SMART:
        return AppLocalizations.of(context)!.umniah_SMART_abbrv;
      case UmniahType.EVO:
        return AppLocalizations.of(context)!.umniah_EVO_abbrv;
    }
  }

  String displayText(BuildContext context) {
    switch (this) {
      case UmniahType.GSM:
        return AppLocalizations.of(context)!.umniah_GSM_text;
      case UmniahType.SMART:
        return AppLocalizations.of(context)!.umniah_SMART_text;
      case UmniahType.EVO:
        return AppLocalizations.of(context)!.umniah_EVO_text;
    }
  }
}

extension EgyptionCardsExtension on EgyptionCardsType {
  String displayAbbreviation(BuildContext context) {
    switch (this) {
      case EgyptionCardsType.VODAFONE:
        return AppLocalizations.of(context)!.egy_VODAFONE_abbrv;

      case EgyptionCardsType.ETISALAT:
        return AppLocalizations.of(context)!.egy_ETISALAT_abbrv;

      case EgyptionCardsType.MOBINIL:
        return AppLocalizations.of(context)!.egy_MOBINIL_abbrv;

      case EgyptionCardsType.WE:
        return AppLocalizations.of(context)!.egy_WE_abbrv;
    }
  }

  String displayText(BuildContext context) {
    switch (this) {
      case EgyptionCardsType.VODAFONE:
        return AppLocalizations.of(context)!.egy_VODAFONE_text;

      case EgyptionCardsType.ETISALAT:
        return AppLocalizations.of(context)!.egy_ETISALAT_text;

      case EgyptionCardsType.MOBINIL:
        return AppLocalizations.of(context)!.egy_MOBINIL_text;

      case EgyptionCardsType.WE:
        return AppLocalizations.of(context)!.egy_WE_text;
    }
  }
}

extension RechargePrintTypeExtension on RechargePrintType {
  String displayAbbreviation(BuildContext context) {
    switch (this) {
      case RechargePrintType.zain:
        return AppLocalizations.of(context)!.zain_abbrv;

      case RechargePrintType.orange:
        return AppLocalizations.of(context)!.orange_abbrv;

      case RechargePrintType.umniah:
        return AppLocalizations.of(context)!.umniah_abbrv;

      case RechargePrintType.egyptionCards:
        return AppLocalizations.of(context)!.egyption_cards_abbrv;
    }
  }

  String displayText(BuildContext context) {
    switch (this) {
      case RechargePrintType.zain:
        return AppLocalizations.of(context)!.zain_text;

      case RechargePrintType.orange:
        return AppLocalizations.of(context)!.orange_text;

      case RechargePrintType.umniah:
        return AppLocalizations.of(context)!.umniah_text;

      case RechargePrintType.egyptionCards:
        return AppLocalizations.of(context)!.egyption_cards_text;
    }
  }
}
