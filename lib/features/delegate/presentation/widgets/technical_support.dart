import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'call_icon.dart';
import 'delegate_label.dart';
import 'whatsapp_icon.dart';

class TechnicalSupport extends StatelessWidget {
  final String phoneNumber;
  final String email;
  const TechnicalSupport(
      {super.key, required this.phoneNumber, required this.email});

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
              child: _buildPhone(),
            ),
            Divider(
              height: 16,
              color: Colors.grey.shade200,
            ),
            Expanded(
              child: _buildEmail(),
            ),
          ]),
        )
      ],
    );
  }

  Container _buildEmail() {
    return Container(
      //  color: Colors.blue,
      child: Row(
        children: [
          Container(
            //   color: Colors.yellow,
            alignment: Alignment.center,
            child: const Icon(Icons.email, color: Colors.purple),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Container(
              //  color: Colors.green,
              child: Text(
                email,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container _buildPhone() {
    return Container(
      // color: Colors.red,
      child: Row(
        children: [
          Container(
            //     color: Colors.yellow,
            child: const Icon(
              Icons.phone,
              color: Colors.purple,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Container(
              //     color: Colors.green,
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
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(BuildContext context) {
    return DelegateLabel(
        label: AppLocalizations.of(context)!.technical_support);
  }
}
