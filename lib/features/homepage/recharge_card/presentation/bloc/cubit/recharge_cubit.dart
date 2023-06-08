import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/enums/recharge_enum.dart';
import '../../../data/RechargePrintMethod.dart';

part 'recharge_state.dart';

class RechargeCubit extends Cubit<RechargeState> {
  RechargeCubit()
      : super(
          const RechargeState(),
        );

  void setPrintChargeType(RechargePrintType rechargePrintType) {
    emit(
      state.copyWith(
        rechargePrintType: rechargePrintType,
      ),
    );
  }

  void setPrintChargeMethodZain(ZainType zainType) {
    emit(
      state.copyWith(
        rechargePrintMethod: ZainMethod(
          zainType: zainType,
        ),
      ),
    );
  }

  void setPrintChargeMethodOrange(OrangeType orangeType) {
    emit(
      state.copyWith(
        rechargePrintMethod: OrangeMethod(
          orangeType: orangeType,
        ),
      ),
    );
  }

  void setPrintChargeMethodUmniah(UmniahType umniahType) {
    emit(
      state.copyWith(
        rechargePrintMethod: UmniahMethod(umniahType: umniahType),
      ),
    );
  }

  void setPrintChargeMethodEgyptionCards(EgyptionCardsType egyptionCardsType) {
    emit(
      state.copyWith(
        rechargePrintMethod:
            EgyptionCardsMethod(egyptionCardsType: egyptionCardsType),
      ),
    );
  }

  void setUnitAndPrice(double unit, double price) {
    emit(
      state.copyWith(price: price, unit: unit),
    );
  }

  void resetPrintChargeType() {
    emit(const RechargeState());
  }

  void resetPrintChargeMethod() {
    emit(
      RechargeState(
        rechargePrintType: state.rechargePrintType,
      ),
    );
  }
}
