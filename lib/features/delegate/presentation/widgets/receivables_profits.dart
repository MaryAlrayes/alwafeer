import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/ui/dialogs/transfer_dialog.dart';
import 'delegate_label.dart';

class ReceivablesAndProfits extends StatelessWidget {
  final double receivables;
  final double profits;
  const ReceivablesAndProfits(
      {super.key, required this.receivables, required this.profits});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildLabel(context),
        const SizedBox(
          height: 12,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          width: double.maxFinite,
          height: 125,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.purple.shade200, width: 1)),
          child: Column(children: [
            Expanded(
              child: _buildRecievables(context),
            ),
            Divider(
              height: 16,
              color: Colors.grey.shade200,
            ),
            Expanded(
              child: _buildProfit(context),
            ),
          ]),
        )
      ],
    );
  }

  Container _buildProfit(BuildContext context) {
    return Container(
      //  color: Colors.blue,
      child: Row(
        children: [
          Container(
            //   color: Colors.yellow,
            alignment: Alignment.center,
            child: Text(AppLocalizations.of(context)!.total_profits),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Container(
              //  color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.total_profits_num(profits),
                    style: const TextStyle(fontSize: 16, color: Colors.green),
                  ),
                  _buildTransferBtn(context)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  ElevatedButton _buildTransferBtn(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => showTransferDialog(context),
        );
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      child: Text(
        AppLocalizations.of(context)!.transfer_btn,
      ),
    );
  }

  Container _buildRecievables(BuildContext context) {
    return Container(
      // color: Colors.red,
      child: Row(
        children: [
          Container(
              //     color: Colors.yellow,
              child: Text(AppLocalizations.of(context)!.total_receivables)),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Container(
              //     color: Colors.green,
              child: Text(
                AppLocalizations.of(context)!.total_profits_num(receivables),
                style: const TextStyle(fontSize: 16, color: Colors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(BuildContext context) {
    return DelegateLabel(
        label: AppLocalizations.of(context)!.receivables_and_profits);
  }
}
