import 'package:alwafeer/core/utils/enums/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit()
      : super(const NavigationState(index: 2, navType: HomepageNavigation.home));
  void getNavBarItem(HomepageNavigation navType) {
    switch (navType) {
      case HomepageNavigation.log:
        emit(const NavigationState(navType: HomepageNavigation.log, index: 0));
        break;

      case HomepageNavigation.notification:
        emit(const NavigationState(
            navType: HomepageNavigation.notification, index: 1));
        break;
      case HomepageNavigation.home:
        emit(const NavigationState(navType: HomepageNavigation.home, index: 2));
        break;
      case HomepageNavigation.delegate:
        emit(const NavigationState(navType: HomepageNavigation.delegate, index: 3));
        break;
      case HomepageNavigation.settings:
        emit(const NavigationState(navType: HomepageNavigation.settings, index: 4));
        break;
    }
  }
}
