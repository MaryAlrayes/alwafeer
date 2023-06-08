import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../hompage_navigation/presentation/screens/homepage_navigation_screen.dart';
import '../../../style/text_field_style.dart';
import '../../../common%20widgets/lang_switch.dart';
import '../../../common%20widgets/logo.dart';

class VerficationCodeScreen extends StatelessWidget {
  static const routeName = "verfication_code_screen";
  const VerficationCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final h = (MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.top -
            MediaQuery.of(context).padding.bottom) -
        32;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0).copyWith(left: 24, right: 24),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    //  color: Colors.purple,
                    alignment: Alignment.center,
                    height: h * 0.25,
                    child: _buildLogo(),
                  ),
                  Container(
                    // color: Colors.red,
                    // height: h * 0.10,
                    child: _buildLangSwitch(),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    child: _buildContent(context),
                  )
                ]),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildLabel(context),
        const SizedBox(
          height: 8,
        ),
        _buildSubtitle(context),
        const SizedBox(
          height: 16,
        ),
        _buildVerficationCodeField(context),
        const SizedBox(
          height: 16,
        ),
        _buildVerifyBtn(context)
      ],
    );
  }

  ElevatedButton _buildVerifyBtn(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, HomepageNavigationScreen.routeName);
      },
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(8),
          backgroundColor: Colors.orange.shade400),
      child: Text(AppLocalizations.of(context)!.verfiy),
    );
  }

  Text _buildSubtitle(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.verfication_code_subtitle,
      textAlign: TextAlign.center,
      style: const TextStyle(color: Colors.white, fontSize: 16),
    );
  }

  Text _buildLabel(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.verfication_code_label,
      textAlign: TextAlign.center,
      style: const TextStyle(color: Colors.white, fontSize: 20),
    );
  }

  Widget _buildLogo() {
    return const Logo();
  }

  Widget _buildLangSwitch() {
    return const LanguageSwitch();
  }

  Widget _buildVerficationCodeField(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        focusedBorder: kFocusedBorder.copyWith(
          borderRadius: const BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        enabledBorder: kEnabledBorder.copyWith(
          borderRadius: const BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        focusedErrorBorder: kFocusedErrorBorder.copyWith(
          borderRadius: const BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        errorBorder: kErrorBorder.copyWith(
          borderRadius: const BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        hintStyle: kHintStyle,
        errorStyle: kErrorStyle,
        prefixIcon: const Padding(
          padding: EdgeInsets.only(right: 8.0),
        ),
      ),
      validator: (value) {
        if (value != null) {
          if (value.isEmpty) {
          } else {
            return null;
          }
        }
      },
    );
  }
}
