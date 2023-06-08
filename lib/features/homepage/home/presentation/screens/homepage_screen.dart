import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../../../../../core/ui/widgets/background.dart';
import '../../../../../../../core/utils/constants/assets_path.dart';
import '../../../electronic_wallets/presentation/screens/electronic_wallets_screen.dart';
import '../../../events_ticket/presentation/screen/events_tickets_screen.dart';
import '../../../gaming_cards/presentation/screens/gaming_cards_screen.dart';
import '../../../pay_bills/presentation/screens/pay_bills_list_screen.dart';
import '../../../recharge_card/presentation/screens/recharge_print_screen.dart';
import '../../../recharge_card/presentation/screens/recharge_shipping_screen.dart';
import '../widgets/home_item.dart';

class HomepageScreen extends StatelessWidget {
  static const routeName = "homepage_screen";
  const HomepageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> items = _getItems(context);
    return Stack(
      children: [
        const Background(),
        SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(25.0).copyWith(top: 115),
            child: AnimationLimiter(
              child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 5 / 4,
                  children: List.generate(
                    items.length,
                    (index) => _buildItem(index, items, context),
                  )),
            ),
          ),
        )
      ],
    );
  }

  AnimationConfiguration _buildItem(
      int index, List<Map<String, String>> items, BuildContext context) {
    return AnimationConfiguration.staggeredGrid(
      position: index,
      columnCount: 2,
      child: ScaleAnimation(
        child: FadeInAnimation(
          duration: const Duration(milliseconds: 800),
          child: HomeItem(
            title: items[index]['title'] as String,
            image: items[index]['icon'] as String,
            handler: () =>
                Navigator.pushNamed(context, items[index]['route'] as String),
          ),
        ),
      ),
    );
  }

  List<Map<String, String>> _getItems(BuildContext context) {
    final items = [
      {
        'title': AppLocalizations.of(context)!.charge_card_print,
        'icon': AssetsPath.SHIP_CARD_ICON,
        'route': RechargePrintScreen.routeName,
      },
      {
        'title': AppLocalizations.of(context)!.charge_card_ship,
        'icon': AssetsPath.CHARGE_CARD_ICON,
        'route': RechargeShippingScreen.routeName,
      },
      {
        'title': AppLocalizations.of(context)!.game_card,
        'icon': AssetsPath.GAME_CARD_ICON,
        'route': GamingCardsScreen.routeName,
      },
      {
        'title': AppLocalizations.of(context)!.pay_bills,
        'icon': AssetsPath.PAY_BILL_ICON,
        'route': PayBillsListScreen.routeName,
      },
      {
        'title': AppLocalizations.of(context)!.store_channels,
        'icon': AssetsPath.CHANNEL_ICON,
        'route': '',
      },
      {
        'title': AppLocalizations.of(context)!.electronic_wallets,
        'icon': AssetsPath.WALLET_ICON,
        'route': ElectronicWallets.routeName,
      },
      {
        'title': AppLocalizations.of(context)!.events_ticket,
        'icon': AssetsPath.TICKETS_ICON,
        'route': EventsTicketsScreen.routeName,
      },
      {
        'title': AppLocalizations.of(context)!.social_media,
        'icon': AssetsPath.SOCIAL_MEDIA_ICON,
        'route': '',
      },
      {
        'title': AppLocalizations.of(context)!.electronic_devices,
        'icon': AssetsPath.ELECTRONIC_DEVICES_ICON,
        'route': '',
      },
      {
        'title': AppLocalizations.of(context)!.maintenance_accessories,
        'icon': AssetsPath.MAINTENANCE_ICON,
        'route': '',
      },
    ];
    return items;
  }
}
