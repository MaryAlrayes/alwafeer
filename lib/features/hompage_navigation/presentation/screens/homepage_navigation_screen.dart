import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/ui/widgets/balance.dart';
import '../../../../core/ui/widgets/custom_app_bar.dart';
import '../../../../core/utils/enums/enums.dart';
import '../../../delegate/presentation/screens/delegate_screen.dart';
import '../../../homepage/home/presentation/screens/homepage_screen.dart';
import '../../../logcat/presentation/screens/log_screen.dart';
import '../../../notification/presentation/screens/notifications_screen.dart';
import '../../../settings/presentation/screens/settings_screen.dart';
import '../bloc/cubit/navigation_cubit.dart';
import '../widgets/nav_bottom_bar_style.dart';

class HomepageNavigationScreen extends StatelessWidget {
  static const routeName = 'homepage_navigation_screen';
  const HomepageNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> tabItems = [
      {
        'tab': TabItem(
          icon: Icons.settings,
          title: AppLocalizations.of(context)!.settings,
        ),
        'page': HomepageNavigation.settings
      },
      {
        'tab': TabItem(
            icon: Icons.person,
            title: AppLocalizations.of(context)!.delegate_person),
        'page': HomepageNavigation.delegate
      },
      {
        'tab': TabItem(
            icon: Icons.home_outlined,
            title: AppLocalizations.of(context)!.home),
        'page': HomepageNavigation.home
      },
      {
        'tab': TabItem(
            icon: Icons.notifications_on_outlined,
            title: AppLocalizations.of(context)!.notification),
        'page': HomepageNavigation.notification
      },
      {
        'tab': TabItem(
            icon: Icons.settings_backup_restore_sharp,
            title: AppLocalizations.of(context)!.log),
        'page': HomepageNavigation.log
      }
    ];

    return Scaffold(
      bottomNavigationBar: _buildBottomNavBar(tabItems),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            _buildBody(),
            const Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: CustomAppBar(),
            ),
            const Positioned(
              top: 38,
              child: Balance(),
            )
          ],
        ),
      ),
    );
  }

  BlocBuilder<NavigationCubit, NavigationState> _buildBody() {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        if (state.navType == HomepageNavigation.log) {
          return const LogScreen();
        } else if (state.navType == HomepageNavigation.notification) {
          return const NotificationScreen();
        } else if (state.navType == HomepageNavigation.home) {
          return const HomepageScreen();
        } else if (state.navType == HomepageNavigation.delegate) {
          return const DelegateScreen();
        } else if (state.navType == HomepageNavigation.settings) {
          return const SettingsScreen();
        } else {
          return Container();
        }
      },
    );
  }

  BlocBuilder<NavigationCubit, NavigationState> _buildBottomNavBar(
      List<Map<String, dynamic>> tabItems) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return StyleProvider(
          style: StyleNavBottomBar(),
          child: ConvexAppBar(
            style: TabStyle.reactCircle,
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.purple,
            initialActiveIndex: state.index,
            curveSize: 90,
            height: 80,
            onTap: (index) {
              BlocProvider.of<NavigationCubit>(context)
                  .getNavBarItem(tabItems[index]['page']);
            },
            elevation: 2,
            items: tabItems.map((e) => e['tab'] as TabItem).toList(),
          ),
        );
      },
    );
  }
}
