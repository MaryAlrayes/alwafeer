import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/ui/widgets/background.dart';
import '../widgets/log_item.dart';

class LogScreen extends StatelessWidget {
  static const routeName = 'log_Screen';
  const LogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const Background(),
      Padding(
        padding: const EdgeInsets.all(16.0).copyWith(top: 100),
        child: Column(children: [
          _buildLabel(context),
          const SizedBox(
            height: 8,
          ),
          _buildInventoryInfo(context),
          const SizedBox(
            height: 16,
          ),
          _buildLogList(),
        ]),
      )
    ]);
  }

  Expanded _buildLogList() {
    return Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              height: 8,
            ),
            itemBuilder: (context, index) {
              return const LogItem();
            },
            itemCount: 10,
          ),
        );
  }

  Row _buildInventoryInfo(BuildContext context) {
    return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTransactionNumber(),
            const SizedBox(
              width: 8,
            ),
            _buildInvetoryBtn(context)
          ],
        );
  }

  Text _buildLabel(BuildContext context) {
    return Text(
          AppLocalizations.of(context)!.transaction_number_label,
          style: const TextStyle(fontSize: 16, color: Colors.black),
        );
  }

  Container _buildTransactionNumber() {
    return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: const Color(0xfff8d973),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              child: const Text('0'),
            );
  }

  ElevatedButton _buildInvetoryBtn(BuildContext context) {
    return ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
              child: Text(AppLocalizations.of(context)!.clear),
            );
  }

}
