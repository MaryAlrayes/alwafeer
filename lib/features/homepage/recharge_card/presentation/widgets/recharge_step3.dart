import 'package:alwafeer/core/bloc/bloc/stepper_cubit.dart';
import 'package:alwafeer/features/homepage/common_presentation/widgets/step3_item1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../core/utils/enums/recharge_enum.dart';
import '../../data/RechargePrintMethod.dart';
import '../bloc/cubit/recharge_cubit.dart';

import '../dialogs/confirm_recharge.dart';

class RechargePrintStep3 extends StatefulWidget {
  const RechargePrintStep3({
    super.key,
  });

  @override
  State<RechargePrintStep3> createState() => _RechargePrintStep3State();
}

class _RechargePrintStep3State extends State<RechargePrintStep3>
    with TickerProviderStateMixin {
  final List<double> units = const [0.5, 1, 3, 5, 12];
  final List<double> prices = const [1, 1.5, 5, 12, 15];
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RechargeCubit, RechargeState>(
      builder: (context, state) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: Offset.zero)
              .animate(_controller),
          child: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.start,
            runSpacing: 8,
            spacing: 4,
            children: getContent(state, context),
          ),
        );
      },
    );
  }

  List<Widget> getContent(RechargeState state, BuildContext context) {
    switch (state.rechargePrintType!) {
      case RechargePrintType.zain:
        return getZainContent(context);
      case RechargePrintType.orange:
        return getOrangeContent(context);
      case RechargePrintType.umniah:
        return getUmniahContent(context);
      case RechargePrintType.egyptionCards:
        return getEgyptionCardsContent(context, state.rechargePrintMethod!);
    }
  }

  List<Widget> _addItems(
      {required String currency,
      required Color backgroundColor,
      required Color textColor,
      required Color currencyColor,
      required context}) {
    List<Widget> items = [];
    for (int i = 0; i < units.length; i++) {
      items.add(
        Step3Item1(
            unit: units[i],
            price: prices[i],
            currency: currency,
            backgroundColor: backgroundColor,
            textColor: textColor,
            currencyColor: currencyColor,
            handler: () {
              BlocProvider.of<RechargeCubit>(context)
                  .setUnitAndPrice(units[i], prices[i]);

              showDialog(
                context: context,
                builder: (dialogContext) => showConfirmRechargeDialog(
                  dialogContext,
                  BlocProvider.of<StepperCubit>(context),
                ),
              );
            }),
      );
    }
    return items;
  }

  List<Widget> getZainContent(BuildContext context) {
    return _addItems(
        currency: AppLocalizations.of(context)!.recharge_step3_jod_currency,
        backgroundColor: Colors.black,
        textColor: const Color(0xff90bca3),
        currencyColor: Colors.purple,
        context: context);
  }

  List<Widget> getOrangeContent(BuildContext context) {
    return _addItems(
        currency: AppLocalizations.of(context)!.recharge_step3_jod_currency,
        backgroundColor: const Color(0xffff6a00),
        textColor: Colors.white,
        currencyColor: Colors.white,
        context: context);
  }

  List<Widget> getUmniahContent(BuildContext context) {
    return _addItems(
        currency: AppLocalizations.of(context)!.recharge_step3_jod_currency,
        backgroundColor: const Color(0xffE2E749),
        textColor: Colors.black,
        currencyColor: Colors.black,
        context: context);
  }

  List<Widget> getEgyptionCardsContent(
      BuildContext context, RechargePrintMethod rechargePrintMethod) {
    EgyptionCardsType egyptionCardsType =
        (rechargePrintMethod as EgyptionCardsMethod).egyptionCardsType;

    switch (egyptionCardsType) {
      case EgyptionCardsType.VODAFONE:
        return _addItems(
            currency: AppLocalizations.of(context)!.recharge_step3_egp_currency,
            backgroundColor: const Color(0xffe60000),
            textColor: Colors.white,
            currencyColor: Colors.white,
            context: context);

      case EgyptionCardsType.ETISALAT:
        return _addItems(
            currency: AppLocalizations.of(context)!.recharge_step3_egp_currency,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            currencyColor: Colors.white,
            context: context);

      case EgyptionCardsType.MOBINIL:
        return _addItems(
            currency: AppLocalizations.of(context)!.recharge_step3_egp_currency,
            backgroundColor: const Color(0xfffd7701),
            textColor: Colors.white,
            currencyColor: Colors.white,
            context: context);

      case EgyptionCardsType.WE:
        return _addItems(
            currency: AppLocalizations.of(context)!.recharge_step3_egp_currency,
            backgroundColor: Colors.black,
            textColor: Colors.purple,
            currencyColor: Colors.white,
            context: context);
    }
  }
}
