import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/ui/widgets/background.dart';
import '../../../../core/utils/enums/enums.dart';
import '../cubit/notification_filter_cubit.dart';
import '../widgets/charge_notification.dart';
import '../widgets/notification_filter.dart';
import '../widgets/pay_notification.dart';

class NotificationScreen extends StatelessWidget {
  static const routeName = "notifications_screen";
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => BlocProvider(
        create: (context) => NotificationFilterCubit()
          ..getNotification(NotificationFilterType.all),
        child: Stack(children: [
          const Background(),
          Padding(
            padding: const EdgeInsets.all(16.0).copyWith(top: 100),
            child:
                BlocBuilder<NotificationFilterCubit, NotificationFilterState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const NotificationFilter(),
                    const SizedBox(
                      height: 16,
                    ),
                    Expanded(
                      child: BlocBuilder<NotificationFilterCubit,
                          NotificationFilterState>(
                        builder: (context, state) {
                          if (state is NotificationDataState) {
                            return _buildNotificationList(state);
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          )
        ]),
      ),
    );
  }

  ListView _buildNotificationList(NotificationDataState state) {
    return ListView.separated(
      itemCount: state.notifications.length,
      separatorBuilder: (context, index) => const SizedBox(
        height: 2,
      ),
      itemBuilder: (context, index) {
        return _getNotificationWidget(
            state.notifications[index].notificationType,
            state.notifications[index]);
      },
    );
  }

  Widget _getNotificationWidget(
      NotificationType notificationType, Notification notification) {
    switch (notificationType) {
      case NotificationType.pay:
        return PayNotification(
          amount: notification.amount,
          date: notification.date,
        );
      case NotificationType.charge:
        return ChargeNotification(
          amount: notification.amount,
          date: notification.date,
        );
    }
  }
}

class Notification {
  final String id;
  final NotificationType notificationType;
  final double amount;
  final DateTime date;
  Notification({
    required this.id,
    required this.amount,
    required this.notificationType,
    required this.date,
  });
}
