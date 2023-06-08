import 'package:alwafeer/core/bloc/bloc/stepper_cubit.dart';
import 'package:alwafeer/core/ui/widgets/snackbar.dart';
import 'package:alwafeer/features/recharge_balance/presentation/widgets/next_btn.dart';

import '../../../../core/ui/widgets/custom_text_field.dart';
import '../bloc/cubit/recharge_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Step1 extends StatelessWidget {
  Step1({
    Key? key,
  }) : super(key: key);
  TextEditingController amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildLabel(context),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            _buildField(context),
            const SizedBox(
              width: 16,
            ),
            _buildCurrency(context),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _buildNextBtn(context),
          ],
        )
      ],
    );
  }

  Widget _buildNextBtn(BuildContext context) {
    return NextBtn(handler: () {
      double amount = double.parse(amountController.text);
      if (amount <= 0) {
        showSnackbar(context, AppLocalizations.of(context)!.recharge_balance_step1_wrong_input);
      } else {
        BlocProvider.of<RechargeCubit>(context).setAmount(amount);
        BlocProvider.of<StepperCubit>(context).nextStep();
      }
    });
  }

  Widget _buildField(BuildContext context) {
    return BlocBuilder<RechargeCubit, RechargeState>(
      builder: (context, state) {
        amountController.text= state.amount.toString();
        return Expanded(
            child: CustomTextField(
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.number,
          hintText: state.amount.toStringAsFixed(2),
          backgroundColor: const Color(0xFFF2F2F2),
          textEditingController: amountController,
          validator: (value) {},
          isObscure: false,
          iconData: FontAwesomeIcons.coins,
        ));
      },
    );
  }

  Text _buildCurrency(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.jordon_currency,
      style: const TextStyle(fontSize: 16),
    );
  }

  Text _buildLabel(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.rechrage_balance_step1_label,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
