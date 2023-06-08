
import 'package:alwafeer/core/bloc/bloc/stepper_cubit.dart';
import 'package:alwafeer/features/homepage/common_presentation/widgets/custome_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/ui/dialogs/exit_dialog.dart';
import '../../../../core/ui/widgets/background.dart';
import '../../../../core/ui/widgets/balance.dart';
import '../../../../core/ui/widgets/custom_app_bar.dart';


class StepperScreen extends StatelessWidget {
  final List<String> titles;
  final List<Widget> contents;
  final Function resetHandler;

  const StepperScreen({
    Key? key,
    required this.titles,
    required this.contents,
    required this.resetHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showConfirmExitDialog(context);
        return shouldPop ?? false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Stack(children: [
                _buildBackground(),
                Padding(
                  padding: const EdgeInsets.all(20.0).copyWith(top: 100),
                  child: _buildStepper(context),
                ),
              ]),
              _buildAppBar(),
              _buildBalance(),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool?> showConfirmExitDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (dialogContext) => showExitDialog(context),
    );
  }

  Positioned _buildBalance() {
    return const Positioned(
      top: 38,
      child: Balance(),
    );
  }

  Positioned _buildAppBar() {
    return const Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: CustomAppBar(),
    );
  }

  Background _buildBackground() => const Background();

  Widget _buildStepper(BuildContext context) {
    return BlocBuilder<StepperCubit, StepperState>(
      builder: (context, state) {
        return CustomeStepper(
            width: MediaQuery.of(context).size.width,
            length: 4,
            curStep: state.currentStep,
            circleActiveColor: Colors.purple,
            circleInactiveColor: Colors.purple.withOpacity(0.4),
            resetHandler: resetHandler,
            titles: titles,
            content: contents);
      },
    );
  }
}
