import 'package:alwafeer/core/utils/enums/electronic_wallets_enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'electronic_wallets_state.dart';

class ElectronicWalletsCubit extends Cubit<ElectronicWalletsState> {
  ElectronicWalletsCubit() : super(const ElectronicWalletsState());

  void setElectronicWalletType(ElectronicWalletsType electronicWalletsType) {
    emit(state.copyWith(electronicWalletsType: electronicWalletsType));
  }

  void setElectronicWalletPurpose(
      ElectronicWalletsTransferPurpose electronicWalletsTransferPurpose) {
    emit(state.copyWith(
        electronicWalletsTransferPurpose: electronicWalletsTransferPurpose));
  }

  void setElectronicWalletUnitAndPrice(double unit, double price) {
    emit(
      state.copyWith(price: price, unit: unit),
    );
  }

  void resetElectronicWalletType() {
    emit(const ElectronicWalletsState());
  }

  void resetElectronicWalletPurpose() {
    emit(ElectronicWalletsState(
        electronicWalletsType: state.electronicWalletsType));
  }
}
