import 'package:alwafeer/core/bloc/bloc/stepper_cubit.dart';
import 'package:alwafeer/features/homepage/common_presentation/screens/stepper_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cubit/gaming_cards_cubit.dart';
import '../widgets/gaming_cards_step1.dart';
import '../widgets/gaming_cards_step2.dart';
import '../widgets/gaming_cards_step3.dart';
import '../widgets/gaming_cards_step4.dart';

class GamingCardsScreen extends StatelessWidget {
  static const routeName = 'gaming_cards_screen';
  const GamingCardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => StepperCubit(maxStep: 4),
        ),
           BlocProvider(
          create: (context) => GamingCardsCubit(),
        ),
      ],
      child: Builder(
        builder: (builderContext) =>
            BlocBuilder<GamingCardsCubit, GamingCardsState>(
          builder: (context, state) {
            return StepperScreen(
              resetHandler: reset,
              titles: ['','',''],
              contents: [
                GamingCardsStep1(),
                GamingCardsStep2(),
                GamingCardsStep3(),
                GamingCardsStep4(),
              ],
            );
          },
        ),
      ),
    );
  }

  void reset(int clickedStep, BuildContext context) {
    switch (clickedStep) {
      case 1:

        break;
      case 2:

        break;
      case 3:
        break;
    }
  }
}
