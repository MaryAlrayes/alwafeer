import 'package:alwafeer/core/ui/widgets/background.dart';
import 'package:alwafeer/core/ui/widgets/custom_form_label.dart';
import 'package:alwafeer/core/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateSellingPointScreen extends StatelessWidget {
  static const routeName = 'create_selling_point_screen';
  CreateSellingPointScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          AppLocalizations.of(context)!.selling_point,
        ),
      ),
      body: Stack(
        children: [
          const Background(),
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _buildStoreName(context),
                    const SizedBox(
                      height: 16,
                    ),
                    _buildPhoneNumber(context),
                    const SizedBox(
                      height: 16,
                    ),
                    _buildPassword(context),
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
            ),
          )
        ],
      ),
    );
  }

  Column _buildStoreName(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomFormLabel(
            title:
                AppLocalizations.of(context)!.create_selling_point_name_field),
        const SizedBox(
          height: 8,
        ),
        CustomTextField(
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.text,
          hintText:
              AppLocalizations.of(context)!.create_selling_point_name_field,
          iconData: Icons.storefront_outlined,
          isObscure: false,
          validator: (value) {
            if (value != null) {}
          },
        )
      ],
    );
  }

  Column _buildPhoneNumber(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomFormLabel(
            title:
                AppLocalizations.of(context)!.create_selling_point_phone_field),
        const SizedBox(
          height: 8,
        ),
        CustomTextField(
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.phone,
          hintText:
              AppLocalizations.of(context)!.create_selling_point_phone_field,
          iconData: Icons.phone,
          isObscure: false,
          validator: (value) {
            if (value != null) {}
          },
        )
      ],
    );
  }

  Column _buildPassword(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomFormLabel(
            title: AppLocalizations.of(context)!
                .create_selling_point_password_field),
        const SizedBox(
          height: 8,
        ),
        CustomTextField(
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.text,
            hintText: AppLocalizations.of(context)!
                .create_selling_point_password_field,
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
                .create_selling_point_confirm_password_field),
        const SizedBox(
          height: 8,
        ),
        CustomTextField(
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.text,
            hintText: AppLocalizations.of(context)!
                .create_selling_point_confirm_password_field,
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
          child: Text(
              AppLocalizations.of(context)!.create_selling_point_create_btn),
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(
                context,
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
            child: Text(
                AppLocalizations.of(context)!.create_selling_point_cancel_btn)),
      ],
    );
  }
}
