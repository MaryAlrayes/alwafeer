// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'notification_filter_cubit.dart';

abstract class NotificationFilterState extends Equatable {
  const NotificationFilterState();

  @override
  List<Object> get props => [];
}

class NotificationFilterInitial extends NotificationFilterState {}

class NotificationDataState extends NotificationFilterState {
  final List<Notification> notifications;
  final NotificationFilterType notificationFilterType;
  NotificationDataState({
    required this.notifications,
    required this.notificationFilterType
  });
  @override
  List<Object> get props => [notifications,notificationFilterType];
}
