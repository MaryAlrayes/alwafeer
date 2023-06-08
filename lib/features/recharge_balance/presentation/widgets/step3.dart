import 'package:alwafeer/core/bloc/bloc/stepper_cubit.dart';
import 'package:alwafeer/features/recharge_balance/presentation/widgets/next_btn.dart';
import 'package:alwafeer/features/recharge_balance/presentation/widgets/previous_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/utils/extensions/recharge_balance_extensions.dart';
import '../bloc/cubit/recharge_cubit.dart';

class Step3 extends StatelessWidget {
  const Step3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildLabel(context),
        const SizedBox(
          height: 16,
        ),
        _buildCardInfo(),
        const SizedBox(
          height: 24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildPreviousButton(context),
            _buildNextBtn(context),
          ],
        )
      ],
    );
  }

  Widget _buildNextBtn(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text(
        AppLocalizations.of(context)!.recharge_balance_step3_confirm_btn,
      ),
    );
  }

  Widget _buildPreviousButton(BuildContext context) {
    return PreviousBtn(handler: () {
      BlocProvider.of<StepperCubit>(context).previousStep();
    });
  }

  Container _buildCardInfo() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.purple.shade200,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildAmount(),
          const SizedBox(
            height: 8,
          ),
          _buildPayMethod()
        ],
      ),
    );
  }

  Widget _buildPayMethod() {
    return BlocBuilder<RechargeCubit, RechargeState>(
      builder: (context, state) {
        return Row(
          children: [
            Text(
              AppLocalizations.of(context)!
                  .recharge_balance_step3_label_payment_label,
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Text(
                state.rechargePayMethod.displayText(context),
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildAmount() {
    return BlocBuilder<RechargeCubit, RechargeState>(
      builder: (context, state) {
        return Row(
          children: [
            Text(
              AppLocalizations.of(context)!.recharge_balance_step3_amount_label,
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Text(
                '${state.amount} ${AppLocalizations.of(context)!.jordon_currency}',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Text _buildLabel(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.recharge_balance_step3_label,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
