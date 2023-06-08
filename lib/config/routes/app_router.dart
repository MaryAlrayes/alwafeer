import 'package:alwafeer/features/homepage/electronic_wallets/presentation/screens/electronic_wallets_screen.dart';
import 'package:alwafeer/features/homepage/events_ticket/presentation/screen/events_tickets_screen.dart';
import 'package:alwafeer/features/homepage/gaming_cards/presentation/screens/gaming_cards_screen.dart';
import 'package:alwafeer/features/homepage/pay_bills/presentation/screens/pay_bill_screen.dart';
import 'package:alwafeer/features/homepage/pay_bills/presentation/screens/pay_bills_list_screen.dart';
import 'package:alwafeer/features/homepage/recharge_card/presentation/screens/recharge_print_screen.dart';
import 'package:alwafeer/features/homepage/recharge_card/presentation/screens/recharge_shipping_screen.dart';
import 'package:alwafeer/features/settings/presentation/screens/change_password_screen.dart';
import 'package:alwafeer/features/settings/presentation/screens/create_selling_point_screen.dart';
import 'package:flutter/material.dart';

import '../../features/auth/login/presentation/screens/login_screen.dart';
import '../../features/auth/signup/presentation/screens/business_account.dart';
import '../../features/auth/signup/presentation/screens/personal_account.dart';
import '../../features/auth/signup/presentation/screens/signup_screen.dart';
import '../../features/auth/signup/presentation/screens/verfication_code_screen.dart';
import '../../features/hompage_navigation/presentation/screens/homepage_navigation_screen.dart';
import '../../features/recharge_balance/presentation/screens/recharge_balance.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case LoginScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
        );

      case SignupScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => SignupScreen(),
        );

      case PersonalAccount.routeName:
        return MaterialPageRoute(
          builder: (context) => PersonalAccount(),
        );

      case BusinessAccount.routeName:
        return MaterialPageRoute(
          builder: (context) => BusinessAccount(),
        );
      case VerficationCodeScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const VerficationCodeScreen(),
        );
      case HomepageNavigationScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const HomepageNavigationScreen(),
        );

      case RechargeBalance.routeName:
        return MaterialPageRoute(
          builder: (context) => const RechargeBalance(),
        );

      case RechargePrintScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const RechargePrintScreen(),
        );

      case RechargeShippingScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const RechargeShippingScreen(),
        );

      // case CheckPrinterScreen.routeName:
      //   return MaterialPageRoute(
      //     builder: (context) =>  CheckPrinterScreen(),
      //   );

      case ChangePasswordScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => ChangePasswordScreen(),
        );

      case CreateSellingPointScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => CreateSellingPointScreen(),
        );

      case PayBillsListScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => PayBillsListScreen(),
        );

      case ElectronicWallets.routeName:
        return MaterialPageRoute(
          builder: (context) => ElectronicWallets(),
        );
      case PayBillScreen.routeName:
        final Map<String, dynamic> args =
            routeSettings.arguments as Map<String, dynamic>;
        final billType = args['billType'] as String;
        return MaterialPageRoute(
          builder: (context) => PayBillScreen(billType: billType),
        );

      case GamingCardsScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => GamingCardsScreen(),
        );


      case EventsTicketsScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => EventsTicketsScreen(),
        );
    }

    return null;
  }
}
