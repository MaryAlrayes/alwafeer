import 'package:alwafeer/core/bloc/bloc/stepper_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/ui/widgets/custom_animated_list.dart';
import '../../../../../core/utils/constants/assets_path.dart';
import '../../../../../core/utils/enums/electronic_wallets_enum.dart';
import '../../../../../core/utils/extensions/electronic_wallets_extensions.dart';

import '../../../common_presentation/widgets/step1_item1.dart';
import '../bloc/cubit/electronic_wallets_cubit.dart';

class ElectronicWalletsStep1 extends StatelessWidget {
   ElectronicWalletsStep1();
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
        AssetsPath.ZAIN_CASH,
         ElectronicWalletsType.zainCash.displayText(context),
        () {
          BlocProvider.of<ElectronicWalletsCubit>(context)
              .setElectronicWalletType(ElectronicWalletsType.zainCash);
          BlocProvider.of<StepperCubit>(context).nextStep();
        },
      ),
    );
    items.add(
      _getItem(
        context,
         Colors.black,
        AssetsPath.ORANGE_MONEY,
       ElectronicWalletsType.orangeMoney.displayText(context),
        () {
         BlocProvider.of<ElectronicWalletsCubit>(context)
              .setElectronicWalletType(ElectronicWalletsType.orangeMoney);
          BlocProvider.of<StepperCubit>(context).nextStep();
        },
      ),
    );
    items.add(
      _getItem(
        context,
        Colors.white,
        AssetsPath.UWALLET,
         ElectronicWalletsType.uWallet.displayText(context),
        () {
         BlocProvider.of<ElectronicWalletsCubit>(context)
              .setElectronicWalletType(ElectronicWalletsType.uWallet);
          BlocProvider.of<StepperCubit>(context).nextStep();
        },
      ),
    );
    items.add(
      _getItem(
        context,
        Colors.white,
        AssetsPath.DINARAK,
       ElectronicWalletsType.dinarkWallet.displayText(context),
        () {
           BlocProvider.of<ElectronicWalletsCubit>(context)
              .setElectronicWalletType(ElectronicWalletsType.dinarkWallet);
          BlocProvider.of<StepperCubit>(context).nextStep();
        },
      ),
    );
    items.add(
      _getItem(
        context,
        Colors.white,
        AssetsPath.PAYPAL,
       ElectronicWalletsType.paypal.displayText(context),
        () {
           BlocProvider.of<ElectronicWalletsCubit>(context)
              .setElectronicWalletType(ElectronicWalletsType.paypal);
          BlocProvider.of<StepperCubit>(context).nextStep();
        },
      ),
    );
    items.add(
      _getItem(
        context,
        Colors.black,
        AssetsPath.LOGIN_ICON,
       ElectronicWalletsType.alwafeerWallet.displayText(context),
        () {
           BlocProvider.of<ElectronicWalletsCubit>(context)
              .setElectronicWalletType(ElectronicWalletsType.alwafeerWallet);
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
