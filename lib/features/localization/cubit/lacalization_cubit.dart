import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../localize_app.dart';

part 'lacalization_state.dart';

class LacalizationCubit extends Cubit<LacalizationState> {
  final LocalizeApp localizeApp;
  LacalizationCubit(
    this.localizeApp,
  ) : super(const LacalizationState(locale: Locale('ar'), isArabic: true));

  Future<void> getSavedLanguage() async {
    String cachedLang = await localizeApp.getCachedLanguageCode();
    bool isArabic = cachedLang == 'ar' ? true : false;
    emit(LacalizationState(
        locale: Locale(
          cachedLang,
        ),
        isArabic: isArabic));
  }

  Future<void> changeLanguage(bool isArabic) async {
    String chooenLang = isArabic ? 'ar' : 'en';
    await localizeApp.cacheLanguageCode(chooenLang);
    emit(LacalizationState(
        locale: Locale(
          chooenLang,
        ),
        isArabic: isArabic));
  }
}
