import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../core/ui/widgets/snackbar.dart';
import '../../../style/text_field_style.dart';
import '../../../common%20widgets/copy_right.dart';
import '../../../common%20widgets/lang_switch.dart';
import '../../../common%20widgets/logo.dart';
import '../widgets/pick_file_business.dart';
import 'verfication_code_screen.dart';

class BusinessAccount extends StatelessWidget {
  static const routeName = 'business_account';
  BusinessAccount({super.key});
  final _formKey = GlobalKey<FormState>();
  final _passwordTextController = TextEditingController();
  final _confirmationPasswordTextController = TextEditingController();
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
            padding: const EdgeInsets.all(16.0).copyWith(left: 20, right: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  //  color: Colors.purple,
                  alignment: Alignment.center,
                  height: h * 0.20,
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
                    margin: const EdgeInsets.only(top: 8),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildBusinessLabel(context),
                          const SizedBox(
                            height: 16,
                          ),
                          _buildForm(context),
                          const SizedBox(
                            height: 30,
                          ),
                          _buildCopyRight(context)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text _buildBusinessLabel(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.create_business_label,
      textAlign: TextAlign.center,
      style: const TextStyle(color: Colors.white, fontSize: 24),
    );
  }

  Form _buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildStoreNameField(context),
            const SizedBox(
              height: 16,
            ),
            _buildPhoneField(context),
            const SizedBox(
              height: 16,
            ),
            _buildPasswordField(context),
            const SizedBox(
              height: 16,
            ),
            _buildConfiramtionPasswordField(context),
            const SizedBox(
              height: 16,
            ),
            _buildPickerBtn(),
            const SizedBox(
              height: 16,
            ),
            _buildSubmitBtn(context),
          ]),
    );
  }

  Widget _buildPickerBtn() {
    return const PickFileBusiness();
  }

  Widget _buildPasswordField(BuildContext context) {
    return TextFormField(
      controller: _passwordTextController,
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
        hintText: AppLocalizations.of(context)!.buiness_password,
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
            return AppLocalizations.of(context)!
                .create_personal_not_empty_field;
          } else {
            return null;
          }
        }
      },
    );
  }

  Widget _buildConfiramtionPasswordField(BuildContext context) {
    return TextFormField(
      controller: _confirmationPasswordTextController,
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
        hintText: AppLocalizations.of(context)!.buiness_confirmation_password,
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
            return AppLocalizations.of(context)!
                .create_personal_not_empty_field;
          } else {
            return null;
          }
        }
      },
    );
  }

  Widget _buildStoreNameField(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        focusedBorder: kFocusedBorder,
        enabledBorder: kEnabledBorder,
        focusedErrorBorder: kFocusedErrorBorder,
        errorBorder: kErrorBorder,
        hintStyle: kHintStyle,
        errorStyle: kErrorStyle,
        hintText: AppLocalizations.of(context)!.business_name,
        prefixIcon: const Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: Icon(
            Icons.storefront_sharp,
            color: Colors.white,
          ),
        ),
      ),
      validator: (value) {
        if (value != null) {
          if (value.isEmpty) {
            return AppLocalizations.of(context)!
                .create_personal_not_empty_field;
          } else {
            return null;
          }
        }
        return null;
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
        hintText: AppLocalizations.of(context)!.buiness_phone,
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
            return AppLocalizations.of(context)!
                .create_personal_not_empty_field;
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
        if (_passwordTextController.text !=
            _confirmationPasswordTextController.text) {
          showSnackbar(context, AppLocalizations.of(context)!.matching_pasword);
        } else if (isValid) {
          Navigator.pushNamed(context, VerficationCodeScreen.routeName);
        }
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange.shade400,
          shape: const StadiumBorder(),
          padding: const EdgeInsets.all(14)),
      child: Text(
        AppLocalizations.of(context)!.create_business_account_btn,
      ),
    );
  }

  Widget _buildLogo() {
    return const Logo();
  }

  Widget _buildLangSwitch() {
    return const LanguageSwitch();
  }

  Widget _buildCopyRight(BuildContext context) {
    return const CopyRight();
  }
}
