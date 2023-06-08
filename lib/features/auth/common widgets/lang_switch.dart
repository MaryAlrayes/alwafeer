
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../localization/cubit/lacalization_cubit.dart';
class LanguageSwitch extends StatelessWidget {
  const LanguageSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(AppLocalizations.of(context)!.english_code,
            style: const TextStyle(color: Colors.white)),
        const SizedBox(
          width: 8,
        ),
        _buildLangSwitch(),
        const SizedBox(
          width: 8,
        ),
        Text(
          AppLocalizations.of(context)!.arabic_code,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }


   Widget _buildLangSwitch() {
    return BlocBuilder<LacalizationCubit, LacalizationState>(
      builder: (context, state) {
        return Switch(
            value: state.isArabic,
            onChanged: (value) {
              BlocProvider.of<LacalizationCubit>(context).changeLanguage(value);
            },
            activeColor: Colors.green,
            inactiveThumbColor: Colors.grey,
            inactiveTrackColor: Colors.grey.shade300);
      },
    );
  }
}
