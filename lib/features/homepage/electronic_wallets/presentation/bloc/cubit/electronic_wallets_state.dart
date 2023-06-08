// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'electronic_wallets_cubit.dart';

class ElectronicWalletsState extends Equatable {
  final ElectronicWalletsType? electronicWalletsType;
  final ElectronicWalletsTransferPurpose? electronicWalletsTransferPurpose;
  final double? unit;
  final double? price;
  const ElectronicWalletsState({
    this.electronicWalletsType,
    this.electronicWalletsTransferPurpose,
    this.unit,
    this.price,
  });

  @override
  List<Object> get props => [
        electronicWalletsType.toString(),
        electronicWalletsTransferPurpose.toString(),
        unit.toString(),
        price.toString()
      ];

  ElectronicWalletsState copyWith({
    ElectronicWalletsType? electronicWalletsType,
    ElectronicWalletsTransferPurpose? electronicWalletsTransferPurpose,
    double? unit,
    double? price,
  }) {
    return ElectronicWalletsState(
      electronicWalletsType: electronicWalletsType ?? this.electronicWalletsType,
      electronicWalletsTransferPurpose: electronicWalletsTransferPurpose ?? this.electronicWalletsTransferPurpose,
      unit: unit ?? this.unit,
      price: price ?? this.price,
    );
  }
}
