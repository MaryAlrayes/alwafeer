import 'package:alwafeer/core/utils/enums/enums.dart';
import 'package:alwafeer/features/notification/data/dummy_data.dart';
import 'package:alwafeer/features/notification/presentation/screens/notifications_screen.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'notification_filter_state.dart';

class NotificationFilterCubit extends Cubit<NotificationFilterState> {
  NotificationFilterCubit() : super(NotificationFilterInitial());

  void getNotification(NotificationFilterType notificationFilterType) {
    switch (notificationFilterType) {
      case NotificationFilterType.all:
        emit(NotificationDataState(
            notifications: notificationData,
            notificationFilterType: NotificationFilterType.all));
        break;
        
      case NotificationFilterType.charge:
        List<Notification> chargeNotifications = notificationData
            .where((element) =>
                element.notificationType == NotificationType.charge)
            .toList();

        emit(NotificationDataState(
            notifications: chargeNotifications,
            notificationFilterType: NotificationFilterType.charge));
        break;

      case NotificationFilterType.pay:
        List<Notification> chargeNotifications = notificationData
            .where(
              (element) => element.notificationType == NotificationType.pay,
            )
            .toList();
        emit(NotificationDataState(
            notifications: chargeNotifications,
            notificationFilterType: NotificationFilterType.pay));

        break;
    }
  }
}
