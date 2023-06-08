import 'package:alwafeer/core/ui/widgets/background.dart';
import 'package:alwafeer/core/ui/widgets/custom_form_label.dart';
import 'package:alwafeer/core/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ChangePasswordScreen extends StatelessWidget {
  static const routeName = 'change_password_screen';
  ChangePasswordScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          AppLocalizations.of(context)!.change_password,
        ),
      ),
      body: Stack(
        children: [
          const Background(),
          Container(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  _buildOldPassword(context),
                  const SizedBox(
                    height: 16,
                  ),
                  _buildNewPassword(context),
                  const SizedBox(
                    height: 16,
                  ),
                  _buildConfirmPassword(context),
                  const SizedBox(
                    height: 16,
                  ),
                  _buildBtns(context)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Column _buildOldPassword(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomFormLabel(
            title: AppLocalizations.of(context)!
                .change_password_old_password_field),
        const SizedBox(
          height: 8,
        ),
        CustomTextField(
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.text,
            hintText: AppLocalizations.of(context)!
                .change_password_old_password_field,
            iconData: Icons.lock,
            validator: (value) {
              if (value != null) {}
            },
            isObscure: true)
      ],
    );
  }

  Column _buildNewPassword(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomFormLabel(
            title: AppLocalizations.of(context)!
                .change_password_new_password_field),
        const SizedBox(
          height: 8,
        ),
        CustomTextField(
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.text,
            hintText: AppLocalizations.of(context)!
                .change_password_new_password_field,
            iconData: Icons.lock,
            validator: (value) {
              if (value != null) {}
            },
            isObscure: true)
      ],
    );
  }

  Column _buildConfirmPassword(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomFormLabel(
            title: AppLocalizations.of(context)!
                .change_password_confirm_new_password_field),
        const SizedBox(
          height: 8,
        ),
        CustomTextField(
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.text,
            hintText: AppLocalizations.of(context)!
                .change_password_confirm_new_password_field,
            iconData: Icons.lock,
            validator: (value) {
              if (value != null) {}
            },
            isObscure: true)
      ],
    );
  }

  Widget _buildBtns(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
          child:
              Text(AppLocalizations.of(context)!.change_password_confirm_btn),
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(
                context,
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
            child:
                Text(AppLocalizations.of(context)!.change_password_cancel_btn)),
      ],
    );
  }
}
