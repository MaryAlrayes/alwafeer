import 'package:alwafeer/core/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../auth/style/text_field_style.dart';

showSmsShippingDialog(BuildContext context, String title) {
  TextEditingController _phone = TextEditingController();
  final formKey = GlobalKey<FormState>();
  return Dialog(
    child:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  alignment: Alignment.center,
                  child: _buildTextField(context),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildDoneBtn(formKey, context),
                    const SizedBox(
                      width: 4,
                    ),
                    _buildCancelBtn(context)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

  );
}

ElevatedButton _buildCancelBtn(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      Navigator.pop(context);
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.purple,
    ),
    child: Text(
      AppLocalizations.of(context)!.sms_shipping_cancel_btn_dialog,
    ),
  );
}

ElevatedButton _buildDoneBtn(
    GlobalKey<FormState> formKey, BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      var isValid = formKey.currentState!.validate();
      if (isValid) {
        Navigator.pop(context, true);
      }
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.purple,
    ),
    child: Text(
      AppLocalizations.of(context)!.sms_shipping_done_btn_dialog,
    ),
  );
}

Widget _buildTextField(BuildContext context) {
  return CustomTextField(
    textInputAction: TextInputAction.next,
    textInputType: TextInputType.phone,
    hintText: AppLocalizations.of(context)!.sms_shipping_phone_number_label,
    validator: (value) {
      if (value != null) {
        if (value.isEmpty) {
               return AppLocalizations.of(context)!
              .sms_shipping_empty_phone_number_dialog;
        } else if (value.length < 10 || value.length > 10) {
          return AppLocalizations.of(context)!
              .sms_shipping_wrong_phone_number_dialog;
        } else {
          return null;
        }
      }
    },
    isObscure: false,
  );
}
