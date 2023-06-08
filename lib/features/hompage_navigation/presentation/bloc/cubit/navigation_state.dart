part of 'navigation_cubit.dart';


class NavigationState extends Equatable {
  final HomepageNavigation navType;
  final int index;
  const NavigationState({
    required this.navType,
    required this.index,
  });

  @override
  List<Object?> get props => [navType, index];
}
