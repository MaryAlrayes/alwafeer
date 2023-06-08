import 'package:alwafeer/core/utils/enums/electronic_wallets_enum.dart';
import 'package:flutter/material.dart';

extension ElectronicWalletsTypeExtension on ElectronicWalletsType {
  String displayAbbreviation(BuildContext context) {
    switch (this) {
      case ElectronicWalletsType.zainCash:
      return 'Zain Cash';
      case ElectronicWalletsType.orangeMoney:
        return 'orange money';
      case ElectronicWalletsType.uWallet:
        return 'UWallet';

      case ElectronicWalletsType.dinarkWallet:
        return 'دينارك';
      case ElectronicWalletsType.paypal:
        return 'Pay Pal';
      case ElectronicWalletsType.alwafeerWallet:
        return 'الوفير';
    }
  }

  String displayText(BuildContext context) {
    switch (this) {
      case ElectronicWalletsType.zainCash:
        return 'Zain Cash';
      case ElectronicWalletsType.orangeMoney:
        return 'Orange Money';
      case ElectronicWalletsType.uWallet:
        return 'UWallet';

      case ElectronicWalletsType.dinarkWallet:
        return 'محفظة دينارك';
      case ElectronicWalletsType.paypal:
        return 'Pay Pal';
      case ElectronicWalletsType.alwafeerWallet:
        return 'محفظة الوفير';
    }
  }
}

extension ElectronicWalletsTransferPurposeExtension
    on ElectronicWalletsTransferPurpose {
  String displayAbbreviation(BuildContext context) {
    switch (this) {
      case ElectronicWalletsTransferPurpose.friendFamily:
        return 'صديق/عائلة';
      case ElectronicWalletsTransferPurpose.personalAccount:
        return 'شخصي';
      case ElectronicWalletsTransferPurpose.other:
        return 'أخرى';
    }
  }

  String displayText(BuildContext context) {
    switch (this) {
      case ElectronicWalletsTransferPurpose.friendFamily:
        return 'تحويل لصديق/ أحد أفراد العائلة';
      case ElectronicWalletsTransferPurpose.personalAccount:
        return 'تحويل للحساب الخاص';
      case ElectronicWalletsTransferPurpose.other:
        return 'أخرى';
    }
  }
}
