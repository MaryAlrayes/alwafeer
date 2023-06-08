
part of 'recharge_cubit.dart';

class RechargeState extends Equatable {
  final RechargePrintType? rechargePrintType;
  final RechargePrintMethod? rechargePrintMethod;
  final double? unit;
  final double? price;

  const RechargeState({
     this.rechargePrintType,
     this.rechargePrintMethod,
     this.unit,
     this.price,
  });

  @override
  List<Object> get props => [
        rechargePrintType.toString(),
        rechargePrintMethod.toString(),
        unit.toString(),
        price.toString()
      ];



  RechargeState copyWith({
    RechargePrintType? rechargePrintType,
    RechargePrintMethod? rechargePrintMethod,
    double? unit,
    double? price,
  }) {
    return RechargeState(
      rechargePrintType: rechargePrintType ?? this.rechargePrintType,
      rechargePrintMethod: rechargePrintMethod ?? this.rechargePrintMethod,
      unit: unit ?? this.unit,
      price: price ?? this.price,
    );
  }
}
