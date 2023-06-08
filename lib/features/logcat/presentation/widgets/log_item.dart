import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LogItem extends StatelessWidget {
  const LogItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.purple,
      child: Row(
        children: [
          Expanded(
            child: Container(
              color: Colors.white,
              child: _buildListTile(context),
            ),
          ),
          _buildPrintBtn(context),
        ],
      ),
    );
  }

  ListTile _buildListTile(BuildContext context) {
    return ListTile(
      title: _buildTitle(context),
      subtitle: _buildSubtitle(context),
      trailing: _buildTrailing(context),
    );
  }

  Container _buildTrailing(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: const Color(0xfff8d973),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        AppLocalizations.of(context)!.log_amount(3.60),
        style: const TextStyle(color: Colors.black),
      ),
    );
  }

  Text _buildSubtitle(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.log_Date(DateTime.now()),
      // maxLines: 1,
      // overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      'زين مكس 3.5',
      style: TextStyle(color: Colors.black),
    );
  }

  InkWell _buildPrintBtn(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            const Icon(
              Icons.print,
              color: Colors.white,
            ),
            Text(
              AppLocalizations.of(context)!.print_label,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
