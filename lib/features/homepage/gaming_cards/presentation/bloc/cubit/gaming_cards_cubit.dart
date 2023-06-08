
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'gaming_cards_state.dart';

class GamingCardsCubit extends Cubit<GamingCardsState> {
  GamingCardsCubit() : super(GamingCardsInitial());
}
