import 'package:alwafeer/core/bloc/bloc/stepper_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/ui/widgets/custom_animated_list.dart';
import '../../../../../core/utils/constants/assets_path.dart';
import '../../../../../core/utils/enums/electronic_wallets_enum.dart';
import '../../../../../core/utils/extensions/electronic_wallets_extensions.dart';

import '../../../common_presentation/widgets/step2_item3.dart';
import '../bloc/cubit/electronic_wallets_cubit.dart';

class ElectronicWalletsStep2 extends StatelessWidget {
  ElectronicWalletsStep2({super.key});
  final GlobalKey<AnimatedListState> _keyList = GlobalKey<AnimatedListState>();

  final List<Widget> _animatedItems = [];
  @override
  Widget build(BuildContext context) {
    _addItems(context);
    return Column(
      children: [
        const Text(
          'اختر الغاية من التحويل',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(height: 8,),
        Expanded(
          child: SingleChildScrollView(
            child: CustomAnimatedList(
              itemsWidgets: _animatedItems,
              keyList: _keyList,
              offset: Tween(
                begin: const Offset(1, 0),
                end: const Offset(0, 0),
              ),
            ),
          ),
        )
      ],
    );
  }

  void _addItems(BuildContext context) {
    List<Widget> items = [];
    items.add(_getItem(
        context,
        ElectronicWalletsTransferPurpose.friendFamily.displayText(context),
        Colors.white,
        AssetsPath.FRIENDS_ICON, () {
      BlocProvider.of<ElectronicWalletsCubit>(context)
          .setElectronicWalletPurpose(
              ElectronicWalletsTransferPurpose.friendFamily);

      BlocProvider.of<StepperCubit>(context).nextStep();
    }));
    items.add(_getItem(
        context,
        ElectronicWalletsTransferPurpose.personalAccount.displayText(context),
        Colors.white,
  AssetsPath.PERSONAL_ICON, () {
      BlocProvider.of<ElectronicWalletsCubit>(context)
          .setElectronicWalletPurpose(
              ElectronicWalletsTransferPurpose.personalAccount);

      BlocProvider.of<StepperCubit>(context).nextStep();
    }));
    items.add(_getItem(
        context,
        ElectronicWalletsTransferPurpose.other.displayText(context),
        Colors.white,
        AssetsPath.OTHER_ICON, () {
      BlocProvider.of<ElectronicWalletsCubit>(context)
          .setElectronicWalletPurpose(ElectronicWalletsTransferPurpose.other);

      BlocProvider.of<StepperCubit>(context).nextStep();
    }));
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

  Widget _getItem(BuildContext context, String text, Color color,
      String icon, VoidCallback handler) {
    return Step2Item3(
      text: text,
      icon: icon,
      c: color,
      handler: handler,
    );
  }
}
