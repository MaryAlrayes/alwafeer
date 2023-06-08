import 'package:alwafeer/core/bloc/bloc/stepper_cubit.dart';
import 'package:alwafeer/features/recharge_balance/presentation/widgets/next_btn.dart';
import 'package:alwafeer/features/recharge_balance/presentation/widgets/previous_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/ui/widgets/background.dart';
import '../../../../core/ui/widgets/snackbar.dart';
import '../../../../core/utils/enums/enums.dart';
import '../bloc/cubit/recharge_cubit.dart';
import '../widgets/step1.dart';
import '../widgets/step2.dart';
import '../widgets/step3.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RechargeBalance extends StatefulWidget {
  static const routeName = "recharge_balance";
  const RechargeBalance({super.key});

  @override
  State<RechargeBalance> createState() => _RechargeBalanceState();
}

class _RechargeBalanceState extends State<RechargeBalance> {
  // double amoumt = 0;
  // RechargePayMethod rechargePayMethod = RechargePayMethod.visaCard;
  @override
  Widget build(BuildContext c) {
    return Builder(
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => RechargeCubit(),
          ),
          BlocProvider(
            create: (context) => StepperCubit(maxStep: 3),
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text(
              AppLocalizations.of(context)!.recharge_balance_label_appbar,
            ),
          ),
          body: Stack(
            children: [
              const Background(),
              BlocBuilder<StepperCubit, StepperState>(
                builder: (context, state) {
                  return _buildStepper(context, state, c);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Theme _buildStepper(
      BuildContext context, StepperState state, BuildContext c) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: const ColorScheme.light(
          primary: Colors.purple,
        ),
      ),
      child: BlocBuilder<StepperCubit, StepperState>(
        builder: (context, state) {
          return Stepper(
            currentStep: state.currentStep,
            onStepTapped: null,
            onStepContinue: null,
            onStepCancel: null,
            type: StepperType.horizontal,
            controlsBuilder: (context, details) {
              return Container();
            },
            steps: [
              _getStep1(state),
              _getStep2(state),
              _getStep3(c, state),
            ],
          );
        },
      ),
    );
  }

  Step _getStep3(BuildContext context, StepperState state) {
    return Step(
      state: state.currentStep > 2 ? StepState.complete : StepState.indexed,
      isActive: state.currentStep >= 2,
      title: Text(AppLocalizations.of(context)!.rechrage_balance_step3_stepper),
      content: const Step3(),
    );
  }

  Step _getStep2(StepperState state) {
    return Step(
      state: state.currentStep > 1 ? StepState.complete : StepState.indexed,
      isActive: state.currentStep >= 1,
      title: Text(
        AppLocalizations.of(context)!.rechrage_balance_step2_stepper,
      ),
      content: const Step2(),
    );
  }

  Step _getStep1(StepperState state) {
    return Step(
      state: state.currentStep > 0 ? StepState.complete : StepState.indexed,
      isActive: state.currentStep >= 0,
      title: Text(
        AppLocalizations.of(context)!.rechrage_balance_step1_stepper,
      ),
      content: Step1(),
    );
  }
}
