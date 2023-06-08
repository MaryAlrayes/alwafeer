import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'call_icon.dart';
import 'delegate_label.dart';
import 'whatsapp_icon.dart';

class DelegateInfo extends StatelessWidget {
  final String name;
  final String phoneNumber;
  const DelegateInfo(
      {super.key, required this.name, required this.phoneNumber});

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
              child: _buildName(),
            ),
            Divider(
              height: 16,
              color: Colors.grey.shade200,
            ),
            Expanded(
              child: _buildPhone(),
            ),
          ]),
        )
      ],
    );
  }

  Container _buildPhone() {
    return Container(
      //  color: Colors.blue,
      child: Row(
        children: [
          Container(
            //    color: Colors.yellow,
            alignment: Alignment.center,
            child: const Icon(Icons.phone, color: Colors.purple),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Container(
              // color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    phoneNumber,
                    style: const TextStyle(fontSize: 16),
                  ),
                  Row(
                    children: [
                      CallIcon(number: phoneNumber),
                      WhatsappIcon(number: phoneNumber)
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container _buildName() {
    return Container(
      // color: Colors.red,
      child: Row(
        children: [
          Container(
            //     color: Colors.yellow,
            child: const Icon(
              Icons.person,
              color: Colors.purple,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Container(
              //     color: Colors.green,
              child: Text(
                name,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(BuildContext context) {
    return  DelegateLabel(label: AppLocalizations.of(context)!.delegate_info);
  }
}
