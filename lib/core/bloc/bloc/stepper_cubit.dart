// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'stepper_state.dart';

class StepperCubit extends Cubit<StepperState> {
  final int maxStep;
  StepperCubit({
    required this.maxStep,
  }) : super(
          StepperState(
            currentStep: 0,
            maxStep: maxStep,
          ),
        );

  void nextStep() {
    int currentStep = state.currentStep;
    if (currentStep < maxStep) {
      currentStep++;
    }
    emit(
      StepperState(
        currentStep: currentStep,
        maxStep: maxStep,
      ),
    );
  }

  void previousStep() {
    int currentStep = state.currentStep;
    if (currentStep < maxStep) {
      currentStep--;
    }
    emit(
      StepperState(
        currentStep: currentStep,
        maxStep: maxStep,
      ),
    );
  }

  void setStep(int step) {
    emit(
      StepperState(
        currentStep: step,
        maxStep: maxStep,
      ),
    );
  }
}
