import 'package:alwafeer/core/bloc/bloc/stepper_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/ui/widgets/custom_animated_list.dart';
import '../../../../../core/utils/constants/assets_path.dart';
import '../../../../../core/utils/enums/recharge_enum.dart';
import '../../../../../core/utils/extensions/recharge_extension.dart';

import '../../../common_presentation/widgets/step2_item1.dart';
import '../../../common_presentation/widgets/step2_item2.dart';
import '../bloc/cubit/recharge_cubit.dart';

class RechargePrintStep2 extends StatelessWidget {
  RechargePrintStep2({
    Key? key,
  }) : super(key: key);
  final GlobalKey<AnimatedListState> _keyList = GlobalKey<AnimatedListState>();
  final List<Widget> _animatedItems = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RechargeCubit, RechargeState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: getContent(state.rechargePrintType!, context),
        );
      },
    );
  }

  Widget getContent(RechargePrintType rechargePrint, BuildContext context) {
    switch (rechargePrint) {
      case RechargePrintType.zain:
        return getZainContent(context);
      case RechargePrintType.orange:
        return getOrangeContent(context);
      case RechargePrintType.umniah:
        return getUmniahContent(context);
      case RechargePrintType.egyptionCards:
        return getEgyptionCardsContent(context);
    }
  }

  void _addAnimatedItems(List<Widget> items) {
    Future ft = Future((() {}));
    for (int i = 0; i < items.length; i++) {
      ft = ft.then((_) {
        return Future.delayed(
          const Duration(milliseconds: 150),
          () {
            _animatedItems.add(items[i]);
            _keyList.currentState!.insertItem(_animatedItems.length - 1);
          },
        );
      });
    }
  }

  Widget _buildAnimatedList(List<Widget> items) {
    _addAnimatedItems(items);
    return CustomAnimatedList(
      itemsWidgets: _animatedItems,
      keyList: _keyList,
      offset: Tween(
        begin: const Offset(1, 0),
        end: const Offset(0, 0),
      ),
    );
  }

  Widget getZainContent(BuildContext context) {
    List<Widget> items = [];
    for (int i = 0; i < ZainType.values.length; i++) {
      items.add(Step2Item1(
        c: Colors.black,
        image: AssetsPath.ZAIN_LOGO,
        text: ZainType.values[i].displayText(context),
        textColor: const Color(0xff90bca3),
        handler: () {
          BlocProvider.of<RechargeCubit>(context).setPrintChargeMethodZain(
            ZainType.values[i],
          );
          BlocProvider.of<StepperCubit>(context).nextStep();
        },
      ));
    }
    return _buildAnimatedList(items);
  }

  Widget getOrangeContent(BuildContext context) {
    List<Widget> items = [];
    for (int i = 0; i < OrangeType.values.length; i++) {
      items.add(
        Step2Item1(
          c: const Color(0xfffd7701),
          image: AssetsPath.ORANGE,
          text: OrangeType.values[i].displayText(context),
          textColor: Colors.white,
          handler: () {
            BlocProvider.of<RechargeCubit>(context).setPrintChargeMethodOrange(
              OrangeType.values[i],
            );
            BlocProvider.of<StepperCubit>(context).nextStep();
          },
        ),
      );
    }
    return _buildAnimatedList(items);
  }

  Widget getUmniahContent(BuildContext context) {
    List<Widget> items = [];
    for (int i = 0; i < UmniahType.values.length; i++) {
      items.add(
        Step2Item1(
          c: const Color(0xffE2E749),
          image: AssetsPath.UMNIAH,
          text: UmniahType.values[i].displayText(context),
          textColor: Colors.black,
          handler: () {
            BlocProvider.of<RechargeCubit>(context).setPrintChargeMethodUmniah(
              UmniahType.values[i],
            );
            BlocProvider.of<StepperCubit>(context).nextStep();
          },
        ),
      );
    }

    return _buildAnimatedList(items);
  }

  Widget getEgyptionCardsContent(BuildContext context) {
    final egyptionCardImages = {
      EgyptionCardsType.ETISALAT: AssetsPath.ETISALAT,
      EgyptionCardsType.VODAFONE: AssetsPath.VODAFONE,
      EgyptionCardsType.MOBINIL: AssetsPath.MOBINIL,
      EgyptionCardsType.WE: AssetsPath.WE,
    };
    final Map<EgyptionCardsType, Color> egyptionCardColors = {
      EgyptionCardsType.ETISALAT: Colors.white,
      EgyptionCardsType.VODAFONE: const Color(0xffe60000),
      EgyptionCardsType.MOBINIL: const Color(0xfffd7701),
      EgyptionCardsType.WE: Colors.black,
    };
    List<Widget> items = [];
    for (int i = 0; i < EgyptionCardsType.values.length; i++) {
      items.add(
        Step2Item2(
          image: egyptionCardImages[EgyptionCardsType.values[i]] as String,
          c: egyptionCardColors[EgyptionCardsType.values[i]] as Color,
          handler: () {
            BlocProvider.of<RechargeCubit>(context)
                .setPrintChargeMethodEgyptionCards(
              EgyptionCardsType.values[i],
            );
            BlocProvider.of<StepperCubit>(context).nextStep();
          },
        ),
      );
    }
    return _buildAnimatedList(items);
  }
}
