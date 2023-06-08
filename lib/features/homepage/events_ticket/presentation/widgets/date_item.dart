// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class DateItem extends StatelessWidget {
  final double width;
  final DateTime date;
  final VoidCallback handler;
  const DateItem({
    Key? key,
    required this.width,
    required this.date,
    required this.handler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
      decoration: _getDecoration(),
      child: FittedBox(
        child: _buildContent(context),
      ),
    );
  }

  Row _buildContent(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(AppLocalizations.of(context)!.ticket_date_filter(date)),
        const SizedBox(
          width: 6,
        ),
        InkWell(
          onTap: handler,
          child: const Icon(
            Icons.close_rounded,
            color: Colors.grey,
            size: 18,

          ),
        ),
      ],
    );
  }

  BoxDecoration _getDecoration() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.purple.shade200,
        ),
        color: Colors.white);
  }
}
