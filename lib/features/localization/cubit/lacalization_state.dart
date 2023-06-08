// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'lacalization_cubit.dart';

class LacalizationState extends Equatable {
  final Locale locale;
  final bool isArabic;
  const LacalizationState({
    required this.locale,
    required this.isArabic,
  });
  @override
  List<Object?> get props => [locale,isArabic];
}
