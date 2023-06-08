import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../hompage_navigation/presentation/screens/homepage_navigation_screen.dart';
import '../../../common%20widgets/copy_right.dart';
import '../../../common%20widgets/lang_switch.dart';
import '../../../common%20widgets/logo.dart';
import '../../../signup/presentation/screens/signup_screen.dart';
import '../../../style/text_field_style.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = 'login_screen';
  LoginScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final h = (MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.top -
            MediaQuery.of(context).padding.bottom) -
        32;
    print('height is ${MediaQuery.of(context).size.height}');
    print('h is ${h}');
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0).copyWith(
            left: 20,
            right: 20,
          ),
          child: SingleChildScrollView(
            child: Container(
              // color: Colors.purple,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    //  color: Colors.purple,
                    alignment: Alignment.center,
                    height: h * 0.25,
                    width: double.infinity,
                    child: _buildLogo(),
                  ),
                  Container(
                    //  color: Colors.red,
                    height: h * 0.08,
                    width: double.infinity,
                    child: _buildLangSwitch(),
                  ),
                  Container(
                    //  color: Colors.green,
                    height: h * 0.60,
                    width: double.infinity,
                    child: _buildForm(context),
                  ),
                  Container(
                    //  color: Colors.blue,
                    height: h * 0.07,
                    width: double.infinity,
                    child: _buildCopyRight(context),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return const Logo();
  }

  Widget _buildLangSwitch() {
    return const LanguageSwitch();
  }

  Form _buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildPhoneField(context),
          _buildPasswordField(context),
          _buildSubmitBtn(context),
          _buildCreateAccountBtn(context),
        ],
      ),
    );
  }

  Widget _buildPasswordField(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.visiblePassword,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        focusedBorder: kFocusedBorder,
        enabledBorder: kEnabledBorder,
        focusedErrorBorder: kFocusedErrorBorder,
        errorBorder: kErrorBorder,
        hintStyle: kHintStyle,
        errorStyle: kErrorStyle,
        hintText: AppLocalizations.of(context)!.password,
        prefixIcon: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.lock,
            color: Colors.white,
          ),
        ),
      ),
      obscureText: true,
      validator: (value) {
        if (value != null) {
          if (value.isEmpty) {
            return AppLocalizations.of(context)!.password_not_empty;
          } else {
            return null;
          }
        }
      },
    );
  }

  Widget _buildPhoneField(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.phone,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        focusedBorder: kFocusedBorder,
        enabledBorder: kEnabledBorder,
        focusedErrorBorder: kFocusedErrorBorder,
        errorBorder: kErrorBorder,
        hintStyle: kHintStyle,
        errorStyle: kErrorStyle,
        hintText: AppLocalizations.of(context)!.phone_number,
        prefixIcon: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.phone,
            color: Colors.white,
          ),
        ),
      ),
      validator: (value) {
        if (value != null) {
          if (value.isEmpty) {
            return AppLocalizations.of(context)!.phone_number_not_empty;
          } else if (value.length < 10 || value.length > 10) {
            return AppLocalizations.of(context)!.phone_number_check_char_number;
          } else {
            return null;
          }
        }
      },
    );
  }

  Widget _buildSubmitBtn(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        var isValid = _formKey.currentState!.validate();
        if (isValid) {
          Navigator.pushReplacementNamed(
              context, HomepageNavigationScreen.routeName);
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange.shade400,
        shape: const StadiumBorder(),
        padding: const EdgeInsets.all(14),
      ),
      child: Text(
        AppLocalizations.of(context)!.login,
      ),
    );
  }

  Widget _buildCreateAccountBtn(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppLocalizations.of(context)!.signup_message,
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(
          width: 4,
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, SignupScreen.routeName);
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.orange,
            padding: const EdgeInsets.symmetric(horizontal: 4),
          ),
          child: Text(AppLocalizations.of(context)!.join_us),
        ),
      ],
    );
  }

  Widget _buildCopyRight(BuildContext context) {
    return const CopyRight();
  }
}
