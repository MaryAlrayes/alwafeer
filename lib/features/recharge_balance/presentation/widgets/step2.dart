import 'package:alwafeer/core/bloc/bloc/stepper_cubit.dart';
import 'package:alwafeer/features/recharge_balance/presentation/widgets/next_btn.dart';
import 'package:alwafeer/features/recharge_balance/presentation/widgets/previous_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utils/enums/enums.dart';
import '../../../../core/utils/extensions/recharge_balance_extensions.dart';
import '../bloc/cubit/recharge_cubit.dart';

class Step2 extends StatelessWidget {
  const Step2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildLabel(context),
        const SizedBox(
          height: 16,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.purple),
            color: const Color(0xFFF2F2F2),
          ),
          child: Row(
            children: [
              _buildMoneyIcon(),
              _buildDropDown(context),
            ],
          ),
        ),
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
    return NextBtn(handler: () {
      BlocProvider.of<StepperCubit>(context).nextStep();
    });
  }

  Widget _buildPreviousButton(BuildContext context) {
    return PreviousBtn(handler: () {
           BlocProvider.of<StepperCubit>(context).previousStep();
    });
  }

  Widget _buildDropDown(BuildContext context) {
    return BlocBuilder<RechargeCubit, RechargeState>(
      builder: (context, state) {
        return Expanded(
          child: DropdownButtonHideUnderline(
            child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton<RechargePayMethod>(
                value: state.rechargePayMethod,
                items: _getItems(context),
                onChanged: (value) {
                  BlocProvider.of<RechargeCubit>(context).setPayMethod(value!);
                },
              ),
            ),
          ),
        );
      },
    );
  }

  List<DropdownMenuItem<RechargePayMethod>> _getItems(BuildContext context) {
    return RechargePayMethod.values
        .map(
          (e) => DropdownMenuItem(
            value: e,
            child: Text(
              e.displayText(context),
            ),
          ),
        )
        .toList();
  }

  Container _buildMoneyIcon() {
    return Container(
      width: 50,
      alignment: Alignment.center,
      child: const Icon(
        FontAwesomeIcons.moneyCheck,
        color: Colors.purple,
      ),
    );
  }

  Text _buildLabel(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.recharge_balance_step2_label,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
