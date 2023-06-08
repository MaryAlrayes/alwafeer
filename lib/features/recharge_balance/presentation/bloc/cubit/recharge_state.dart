// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'recharge_cubit.dart';

class RechargeState extends Equatable {
  final double amount;
  final RechargePayMethod rechargePayMethod;
  const RechargeState({
    required this.amount,
    required this.rechargePayMethod,
  });

  @override
  List<Object> get props => [amount, rechargePayMethod];

  RechargeState copyWith({
    double? amount,
    RechargePayMethod? rechargePayMethod,
  }) {
    return RechargeState(
      amount: amount ?? this.amount,
      rechargePayMethod: rechargePayMethod ?? this.rechargePayMethod,
    );
  }
}
