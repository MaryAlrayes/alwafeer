import 'package:alwafeer/core/bloc/bloc/stepper_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/extensions/electronic_wallets_extensions.dart';

import '../../../common_presentation/screens/stepper_screen.dart';
import '../bloc/cubit/electronic_wallets_cubit.dart';
import '../widgets/electronic_wallets_step1.dart';
import '../widgets/electronic_wallets_step2.dart';
import '../widgets/electronic_wallets_step3.dart';
import '../widgets/electronic_wallets_step4.dart';

class ElectronicWallets extends StatelessWidget {
  static const routeName = "electronic_wallets_screen";
  const ElectronicWallets({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ElectronicWalletsCubit(),
        ),
        BlocProvider(
          create: (context) => StepperCubit(maxStep: 4),
        ),
      ],
      child: Builder(
        builder: (builderContext) =>
            BlocBuilder<ElectronicWalletsCubit, ElectronicWalletsState>(
          builder: (context, state) {
            final type = state.electronicWalletsType == null
                ? ' '
                : state.electronicWalletsType!.displayAbbreviation(context);
            final purpose = state.electronicWalletsTransferPurpose == null
                ? ' '
                : state.electronicWalletsTransferPurpose!
                    .displayAbbreviation(context);

            final unit =
                state.unit == null ? ' ' : state.unit!.toStringAsFixed(2);
            return StepperScreen(
              resetHandler: reset,
              titles: [
                type,
                purpose,
                unit,
              ],
              contents: [
                ElectronicWalletsStep1(),
                 ElectronicWalletsStep2(),
                const ElectronicWalletsStep3(),
                const ElectronicWalletsStep4(),
              ],
            );
          },
        ),
      ),
    );
  }

  void reset(int clickedStep, BuildContext context) {
    switch (clickedStep) {
      case 0:
        BlocProvider.of<ElectronicWalletsCubit>(context)
            .resetElectronicWalletType();
        break;
      case 1:
        BlocProvider.of<ElectronicWalletsCubit>(context)
            .resetElectronicWalletPurpose();
        break;
      case 2:
        break;
    }
  }
}
