import 'change_password_screen.dart';

import 'create_selling_point_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ionicons/ionicons.dart';

import '../../../../core/ui/dialogs/logout_dialog.dart';
import '../../../../core/ui/widgets/background.dart';
import '../widgets/language_item.dart';
import '../widgets/settings_item.dart';
import 'check_printer_screen.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = "settings_screen";
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const Background(),
      Padding(
        padding: const EdgeInsets.all(25.0).copyWith(top: 100),
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              _buildWelcomeText(context),
              const SizedBox(height: 8),
              _buildPhoneText(context),
              const SizedBox(height: 16),
              _buildLnaguageItem(),
              const SizedBox(height: 16),
              _buildCheckPrinterItem(context),
              const SizedBox(height: 16),
              _buildChangePasswordItem(context),
              const SizedBox(height: 16),
              _buildSellingPointItem(context),
              const SizedBox(height: 16),
              _buildLogOutItem(context),
            ],
          ),
        ),
      ),
    ]);
  }

  SettingsItem _buildLogOutItem(BuildContext context) {
    return SettingsItem(
        title: AppLocalizations.of(context)!.log_out,
        icon: Icons.logout,
        handler: () {
          showDialog(
            context: context,
            builder: (context) => showLogOutDialog(context),
          );
        });
  }

  SettingsItem _buildSellingPointItem(BuildContext context) {
    return SettingsItem(
      title: AppLocalizations.of(context)!.selling_point,
      icon: Ionicons.storefront_outline,
      handler: () {
        Navigator.pushNamed(context, CreateSellingPointScreen.routeName);
      },
    );
  }

  SettingsItem _buildChangePasswordItem(BuildContext context) {
    return SettingsItem(
        title: AppLocalizations.of(context)!.change_password,
        icon: Icons.lock_outline,
        handler: () {

          Navigator.pushNamed(context, ChangePasswordScreen.routeName);
        });
  }

  SettingsItem _buildCheckPrinterItem(BuildContext context) {
    return SettingsItem(
        title: AppLocalizations.of(context)!.check_printer,
        icon: Icons.print,
        handler: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CheckPrinterScreen(),
            ),
          );
        });
  }

  LanguageItem _buildLnaguageItem() => const LanguageItem();

  Row _buildWelcomeText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.hello('Someone'),
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Row _buildPhoneText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.phone_number_settings('0792898145'),
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
