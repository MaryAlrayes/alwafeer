import 'package:alwafeer/core/ui/widgets/background.dart';
import 'package:alwafeer/core/ui/widgets/custom_form_label.dart';
import 'package:alwafeer/core/ui/widgets/custom_text_field.dart';
import 'package:alwafeer/features/homepage/pay_bills/presentation/widgets/pay_bill_service_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PayBillScreen extends StatelessWidget {
  static const routeName = 'pay_bill_screen';
  final String billType;
  const PayBillScreen({
    Key? key,
    required this.billType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          _buildCancelBtn(context),
        ],
      ),
      body: SafeArea(
        child: Stack(children: [
          const Background(),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    _buildLastStepText(context),
                    _buildSpace(),
                    _buildCurrentMoney(context),
                    _buildSpace(),
                    _buildBillTypeContainer(context),
                    _buildSpace(),
                    _buildServiceContainer(context),
                    _buildSpace(),
                    _buildBillNumberContainer(context),
                    _buildBillNote(context),
                    _buildSpace(),
                    _buildMoneyField(context),
                    _buildSpace(),
                    _buildSubmitBtn(context)
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  SizedBox _buildSpace() => const SizedBox(
        height: 16,
      );

  TextButton _buildCancelBtn(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
      ),
      child: Text(
        AppLocalizations.of(context)!.pay_bills_details_cancel_btn,
      ),
    );
  }

  Widget _buildSubmitBtn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
          ),
          child:
              Text(AppLocalizations.of(context)!.pay_bills_details_query_btn),
        ),
      ],
    );
  }

  Column _buildMoneyField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomFormLabel(
          title: AppLocalizations.of(context)!.pay_bills_details_payment_label,
        ),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.number,
                  hintText: AppLocalizations.of(context)!
                      .pay_bills_details_payment_label,
                  iconData: null,
                  validator: () {},
                  isObscure: false),
            ),
            const SizedBox(width: 16),
            Text(AppLocalizations.of(context)!.jordon_currency)
          ],
        ),
      ],
    );
  }

  Flexible _buildBillNote(BuildContext context) {
    return Flexible(
      child: Text(
        AppLocalizations.of(context)!.pay_bills_details_bill_note,
      ),
    );
  }

  Column _buildBillNumberContainer(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomFormLabel(
          title:
              AppLocalizations.of(context)!.pay_bills_details_bill_number_label,
        ),
        CustomTextField(
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.number,
            hintText: AppLocalizations.of(context)!
                .pay_bills_details_bill_number_label,
            iconData: null,
            validator: () {},
            isObscure: false),
      ],
    );
  }

  Container _buildServiceContainer(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.purple),
      ),
      child: Row(
        children: [
          Text(
            AppLocalizations.of(context)!.pay_bills_details_service_label,
            style: const TextStyle(
              color: Colors.purple,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          const Expanded(
            child: PayBillServiceDropDown(),
          ),
        ],
      ),
    );
  }

  Container _buildBillTypeContainer(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.purple),
      ),
      child: Row(children: [
        Text(
          AppLocalizations.of(context)!.pay_bills_details_billet_label,
          style: const TextStyle(
            color: Colors.purple,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Text(billType),
      ]),
    );
  }

  Widget _buildCurrentMoney(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        '${AppLocalizations.of(context)!.pay_bills_details_your_current_balance} 20.00 ${AppLocalizations.of(context)!.jordon_currency}',
        style: const TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Text _buildLastStepText(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.pay_bills_details_one_final_step,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
      textAlign: TextAlign.center,
    );
  }
}
