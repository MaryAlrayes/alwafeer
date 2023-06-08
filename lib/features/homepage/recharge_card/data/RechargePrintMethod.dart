// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:alwafeer/core/utils/enums/recharge_enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../../../../core/utils/extensions/recharge_extension.dart';

abstract class RechargePrintMethod extends Equatable {
  String displayText(BuildContext context);
  String displayAbbreviation(BuildContext context);
}

class ZainMethod extends RechargePrintMethod {
  final ZainType zainType;
  ZainMethod({
    required this.zainType,
  });

  @override
  String displayAbbreviation(BuildContext context) {
    return zainType.displayAbbreviation(context);
  }

  @override
  String displayText(BuildContext context) {
    return zainType.displayText(context);
  }

  @override
  List<Object?> get props => [zainType];
}

class OrangeMethod extends RechargePrintMethod {
  final OrangeType orangeType;
  OrangeMethod({
    required this.orangeType,
  });
  @override
  String displayAbbreviation(BuildContext context) {
    return orangeType.displayAbbreviation(context);
  }

  @override
  String displayText(BuildContext context) {
    return orangeType.displayText(context);
  }

  @override
  List<Object?> get props => [orangeType];
}

class UmniahMethod extends RechargePrintMethod {
  final UmniahType umniahType;
  UmniahMethod({
    required this.umniahType,
  });
  @override
  String displayAbbreviation(BuildContext context) {
    return umniahType.displayAbbreviation(context);
  }

  @override
  String displayText(BuildContext context) {
    return umniahType.displayText(context);
  }

  @override
  List<Object?> get props => [umniahType];
}

class EgyptionCardsMethod extends RechargePrintMethod {
  final EgyptionCardsType egyptionCardsType;
  EgyptionCardsMethod({
    required this.egyptionCardsType,
  });
  @override
  String displayAbbreviation(BuildContext context) {
    return egyptionCardsType.displayAbbreviation(context);
  }

  @override
  String displayText(BuildContext context) {
    return egyptionCardsType.displayText(context);
  }

  @override
  List<Object?> get props => [egyptionCardsType];
}
