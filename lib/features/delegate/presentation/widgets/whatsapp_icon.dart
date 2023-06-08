import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/ui/widgets/snackbar.dart';

class WhatsappIcon extends StatelessWidget {
  final String number;
  const WhatsappIcon({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        openwhatsapp(context);
      },
      icon: const Icon(
        FontAwesomeIcons.whatsapp,
        size: 12,
        color: Colors.green,
      ),
    );
  }

  openwhatsapp(BuildContext context) async {
    var whatsapp = number;
    final whatsappUriAndroid = 'whatsapp://send?phone=$whatsapp';

    if (await canLaunchUrlString(whatsappUriAndroid)) {
      await launchUrlString(whatsappUriAndroid);
    } else {
      showSnackbar(context, AppLocalizations.of(context)!.whatsapp_not_installed);
    }
  }
}
