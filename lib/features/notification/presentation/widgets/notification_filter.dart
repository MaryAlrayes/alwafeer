import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/utils/enums/enums.dart';
import '../../../../core/utils/extensions/notification_filter_extensions.dart';
import '../cubit/notification_filter_cubit.dart';

class NotificationFilter extends StatelessWidget {
  const NotificationFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationFilterCubit, NotificationFilterState>(
      builder: (context, state) {
        if (state is NotificationDataState) {
          return Container(
            width: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.purple.shade200),
              // color: const Color(0xFFF2F2F2),
              color: Colors.white,
            ),
            child: _buildDropDown(state, context),
          );
        } else {
          return Container();
        }
      },
    );
  }

  DropdownButtonHideUnderline _buildDropDown(
      NotificationDataState state, BuildContext context) {
    return DropdownButtonHideUnderline(
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButton<NotificationFilterType>(
          value: state.notificationFilterType,
          items: _buildItems(context),
          hint: Text(AppLocalizations.of(context)!.show_all),
          onChanged: (value) {
            BlocProvider.of<NotificationFilterCubit>(context)
                .getNotification(value!);
          },
        ),
      ),
    );
  }

  List<DropdownMenuItem<NotificationFilterType>> _buildItems(
      BuildContext context) {
    return NotificationFilterType.values
        .map(
          (e) => DropdownMenuItem(
            value: e,
            child: Text(
              e.displayText(context),
            ),
          ),
        )
        .toList();
  }
}
