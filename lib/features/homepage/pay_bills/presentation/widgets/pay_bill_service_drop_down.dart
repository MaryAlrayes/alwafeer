import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PayBillServiceDropDown extends StatefulWidget {
  const PayBillServiceDropDown({super.key});

  @override
  State<PayBillServiceDropDown> createState() => _PayBillServiceDropDownState();
}

class _PayBillServiceDropDownState extends State<PayBillServiceDropDown> {
  final List<String> _items = ['خيار 1', 'خيار 2', 'خيار 3'];
  String? choice;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButton<String>(
          value: choice,
          items: _items
              .map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Text(
                    e,
                  ),
                ),
              )
              .toList(),
          hint: Text(AppLocalizations.of(context)!
              .pay_bills_details_pick_service_label),
          onChanged: (value) {
            setState(() {
              choice = value;
            });
          },
        ),
      ),
    );
  }
}
