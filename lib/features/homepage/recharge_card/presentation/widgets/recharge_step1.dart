import 'package:alwafeer/core/bloc/bloc/stepper_cubit.dart';
import 'package:alwafeer/features/homepage/common_presentation/widgets/step1_item1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/constants/assets_path.dart';
import '../../../../../core/utils/enums/recharge_enum.dart';
import '../../../../../core/utils/extensions/recharge_extension.dart';
import '../bloc/cubit/recharge_cubit.dart';

import '../../../../../core/ui/widgets/custom_animated_list.dart';


class RechargePrintStep1 extends StatelessWidget {
  RechargePrintStep1({
    Key? key,
  }) : super(key: key);
  final GlobalKey<AnimatedListState> _keyList = GlobalKey<AnimatedListState>();

  final List<Widget> _animatedItems = [];

  @override
  Widget build(BuildContext context) {
    _addItems(context);
    return SingleChildScrollView(
      child: CustomAnimatedList(
        itemsWidgets: _animatedItems,
        keyList: _keyList,
        offset: Tween(
          begin: const Offset(1, 0),
          end: const Offset(0, 0),
        ),
      ),
    );
  }

  void _addItems(BuildContext context) {
    List<Widget> items = [];
    items.add(
      _getItem(
        context,
        Colors.black,
        AssetsPath.ZAIN,
         RechargePrintType.zain.displayText(context),
        () {
          BlocProvider.of<RechargeCubit>(context)
              .setPrintChargeType(RechargePrintType.zain);
          BlocProvider.of<StepperCubit>(context).nextStep();
        },
      ),
    );
    items.add(
      _getItem(
        context,
        const Color( 0xffff6a00),
        AssetsPath.ORANGE,
         RechargePrintType.orange.displayText(context),
        () {
          BlocProvider.of<RechargeCubit>(context)
              .setPrintChargeType(RechargePrintType.orange);
          BlocProvider.of<StepperCubit>(context).nextStep();
        },
      ),
    );
    items.add(
      _getItem(
        context,
        const Color(0xffE2E749),
        AssetsPath.UMNIAH,
         RechargePrintType.umniah.displayText(context),
        () {
          BlocProvider.of<RechargeCubit>(context)
              .setPrintChargeType(RechargePrintType.umniah);
          BlocProvider.of<StepperCubit>(context).nextStep();
        },
      ),
    );
    items.add(
      _getItem(
        context,
        Colors.white,
        AssetsPath.EGYPTION_CARD,
        RechargePrintType.egyptionCards.displayText(context),
        () {
          BlocProvider.of<RechargeCubit>(context)
              .setPrintChargeType(RechargePrintType.egyptionCards);
          BlocProvider.of<StepperCubit>(context).nextStep();
        },
      ),
    );

    _addAnimatedItems(items);
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

  Widget _getItem(
      BuildContext context, Color color, String image,String title, VoidCallback handler) {
    return Step1Item1(
      backgroundColor: color,
      image: image,
      title: title,
      key: UniqueKey(),
      handler: handler,
    );
  }
}
