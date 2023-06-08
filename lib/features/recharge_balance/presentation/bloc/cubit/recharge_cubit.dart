import 'package:alwafeer/core/utils/enums/enums.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'recharge_state.dart';

class RechargeCubit extends Cubit<RechargeState> {
  RechargeCubit()
      : super(
          const RechargeState(
            amount: 0,
            rechargePayMethod: RechargePayMethod.visaCard,
          ),
        );

  void setAmount(double amount) {
    emit(state.copyWith(amount: amount));
  }

  void setPayMethod(RechargePayMethod method) {
    emit(state.copyWith(rechargePayMethod: method));
  }
}
