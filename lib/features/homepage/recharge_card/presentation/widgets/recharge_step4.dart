import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../core/utils/enums/recharge_enum.dart';
import '../../../../../core/utils/extensions/recharge_extension.dart';
import '../bloc/cubit/recharge_cubit.dart';
import '../../../common_presentation/widgets/last_step_buttons.dart';

class RechargePrintStep4 extends StatelessWidget {
  final RechargeOption rechargeOption;
  const RechargePrintStep4({
    super.key,
    required this.rechargeOption,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RechargeCubit, RechargeState>(
      builder: (context, state) {
        final type = state.rechargePrintType == null
            ? ' '
            : state.rechargePrintType!.displayText(context);
        final caregory = state.rechargePrintMethod == null
            ? ' '
            : state.rechargePrintMethod!.displayText(context);

        final unit = state.unit == null ? ' ' : state.unit!.toStringAsFixed(2);
        final price =
            state.price == null ? ' ' : state.price!.toStringAsFixed(2);

        return SingleChildScrollView(
          child: Column(
            children: [
              _buildInfoCard(context, type, caregory, unit, price),
              const SizedBox(
                height: 8,
              ),
              LastStepButtons(
                rechargeOption: rechargeOption,
              )
            ],
          ),
        );
      },
    );
  }

  Container _buildInfoCard(BuildContext context, String type, String caregory,
      String unit, String price) {
    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.purple.shade200, width: 1),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildLabel(context),
          _buildContent(
              AppLocalizations.of(context)!.recharge_step4_type, type),
          _buildContent(
              AppLocalizations.of(context)!.recharge_step4_category, caregory),
          _buildContent(
              AppLocalizations.of(context)!.recharge_step4_units, unit),
          _buildContent(
              AppLocalizations.of(context)!.recharge_step4_price, price)
        ],
      ),
    );
  }

  Text _buildLabel(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.recharge_purchasing_process_label,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildContent(String label, String value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(
                color: Colors.purple,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}
