import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../localization/cubit/lacalization_cubit.dart';

class LanguageItem extends StatelessWidget {
  const LanguageItem({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          foregroundColor: Colors.black,
          side: const BorderSide(width: 1.0, color: Colors.grey),
          padding: const EdgeInsets.all(20).copyWith(top: 12, bottom: 12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(AppLocalizations.of(context)!.language),
          Row(
            children: [
              Text(AppLocalizations.of(context)!.english),
              Directionality(
                textDirection: TextDirection.rtl,
                child: _buildSwitchLang(),
              ),
              Text(AppLocalizations.of(context)!.arabic),
            ],
          ),
        ],
      ),
      onPressed: () {},
    );
  }

  Widget _buildSwitchLang() {
    return BlocBuilder<LacalizationCubit, LacalizationState>(
      builder: (context, state) {
        return Switch(
          value: state.isArabic,
          onChanged: (value) {
            BlocProvider.of<LacalizationCubit>(context).changeLanguage(value);
          },
          activeColor: Colors.purple,
        );
      },
    );
  }
}
