import 'package:alwafeer/core/bloc/bloc/stepper_cubit.dart';
import 'package:alwafeer/features/homepage/common_presentation/screens/stepper_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/enums/recharge_enum.dart';
import '../../../../../core/utils/extensions/recharge_extension.dart';
import '../bloc/cubit/recharge_cubit.dart';
import '../widgets/recharge_step1.dart';
import '../widgets/recharge_step2.dart';
import '../widgets/recharge_step3.dart';
import '../widgets/recharge_step4.dart';

class RechargeScreen extends StatelessWidget {
  final RechargeOption rechargeOption;
  const RechargeScreen({
    Key? key,
    required this.rechargeOption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RechargeCubit(),
        ),
        BlocProvider(
          create: (context) => StepperCubit(maxStep: 4),
        ),
      ],
      child: Builder(
        builder: (builderContext) => BlocBuilder<RechargeCubit, RechargeState>(
          builder: (context, state) {
            final rechargeState = context.watch<RechargeCubit>().state;
            final type = rechargeState.rechargePrintType == null
                ? ' '
                : rechargeState.rechargePrintType!.displayAbbreviation(context);
            final category = rechargeState.rechargePrintMethod == null
                ? ' '
                : rechargeState.rechargePrintMethod!
                    .displayAbbreviation(context);

            final unit = rechargeState.unit == null
                ? ' '
                : rechargeState.unit!.toStringAsFixed(2);

            return StepperScreen(
              resetHandler: reset,
              titles: [
                type,
                category,
                unit,
              ],
              contents: [
                RechargePrintStep1(),
                RechargePrintStep2(),
                const RechargePrintStep3(),
                RechargePrintStep4(
                  rechargeOption: rechargeOption,
                )
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
        BlocProvider.of<RechargeCubit>(context).resetPrintChargeType();
        break;
      case 1:
        BlocProvider.of<RechargeCubit>(context).resetPrintChargeMethod();
        break;
      case 2:
        break;
    }
  }
}
