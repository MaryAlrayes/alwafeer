import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../common%20widgets/lang_switch.dart';
import '../../../common%20widgets/logo.dart';
import 'business_account.dart';
import 'personal_account.dart';

class SignupScreen extends StatelessWidget {
  static const routeName = 'signup_screen';
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0).copyWith(left: 20, right: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                // color: Colors.purple,
                // height: h * 0.25,
                alignment: Alignment.center,
                child: _buildLogo(),
              ),
              Container(
                // color: Colors.red,
                // height: h * 0.10,
                child: _buildLangSwitch(),
              ),
              Flexible(
                fit: FlexFit.loose,
                child: Container(
                  // color: Colors.blue,
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildJoinigQuestuinLabel(context),
                        const SizedBox(
                          height: 16,
                        ),
                        _buildPersonalAccountBtn(context),
                        const SizedBox(
                          height: 16,
                        ),
                        _buildBusinessAccountBtn(context)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text _buildJoinigQuestuinLabel(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.joining_label,
      textAlign: TextAlign.center,
      style: const TextStyle(color: Colors.white, fontSize: 16),
    );
  }

  ElevatedButton _buildBusinessAccountBtn(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, BusinessAccount.routeName);
      },
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(12),
          shape: const StadiumBorder(),
          backgroundColor: Colors.orange.shade400),
      child: Text(AppLocalizations.of(context)!.business_account),
    );
  }

  ElevatedButton _buildPersonalAccountBtn(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, PersonalAccount.routeName);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        padding: const EdgeInsets.all(12),
        shape: const StadiumBorder(),
      ),
      child: Text(AppLocalizations.of(context)!.personal_account),
    );
  }

  Widget _buildLogo() {
    return const Logo();
  }

  Widget _buildLangSwitch() {
    return const LanguageSwitch();
  }
}
