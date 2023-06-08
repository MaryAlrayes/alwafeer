import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/ui/widgets/custom_animated_list.dart';
import '../../../../core/utils/enums/recharge_enum.dart';
import '../../recharge_card/presentation/dialogs/sms_shipping_dialog.dart';

class LastStepButtons extends StatelessWidget {
  final RechargeOption rechargeOption;
  LastStepButtons({super.key, required this.rechargeOption});
  final GlobalKey<AnimatedListState> _keyList = GlobalKey<AnimatedListState>();
  final List<Widget> _animatedItems = [];
  @override
  Widget build(BuildContext context) {
    return _buildAnimatedList(context);
  }

  Widget _buildAnimatedList(BuildContext context) {
    List<Widget> buttons = _getButtons(context);

    _addAnimatedBtns(buttons);
    return CustomAnimatedList(
      itemsWidgets: _animatedItems,
      keyList: _keyList,
      offset: Tween(
        begin: const Offset(1, 0),
        end: const Offset(0, 0),
      ),
    );
  }

  void _addAnimatedBtns(List<Widget> items) {
    Future ft = Future((() {}));
    for (int i = 0; i < items.length; i++) {
      ft = ft.then((_) {
        return Future.delayed(
          const Duration(milliseconds: 300),
          () {
            _animatedItems.add(items[i]);
            _keyList.currentState!.insertItem(_animatedItems.length - 1);
          },
        );
      });
    }
  }

  List<Widget> _getButtons(BuildContext context) {
    List<Widget> btns = [];
    switch (rechargeOption) {
      case RechargeOption.print:
        btns = [
          _printBtn(context),
          _shareBtn(context),
          _smsBtn(context),
        ];
        break;
      case RechargeOption.shipping:
        btns = [
          _shippingBtn(context),
        ];
        break;
    }

    return btns;
  }

  ElevatedButton _shippingBtn(BuildContext context) => _buildBtn(
        Icons.local_shipping,
        AppLocalizations.of(context)!.recharge_step4_direct_charging_label,
        () {
          showDialog(
            context: context,
            builder: (dialogContext) => showSmsShippingDialog(
                context, AppLocalizations.of(context)!.shipping_title_dialog),
          );
        },
      );

  ElevatedButton _smsBtn(BuildContext context) => _buildBtn(
        Icons.sms_rounded,
        AppLocalizations.of(context)!.recharge_step4_sms_label,
        () {
          showDialog(
            context: context,
            builder: (dialogContext) => showSmsShippingDialog(
                context, AppLocalizations.of(context)!.sms_title_dialog),
          );
        },
      );

  ElevatedButton _shareBtn(BuildContext context) => _buildBtn(Icons.share,
      AppLocalizations.of(context)!.recharge_step4_share_label, () {});

  ElevatedButton _printBtn(BuildContext context) => _buildBtn(Icons.print,
      AppLocalizations.of(context)!.recharge_step4_print_label, () {});

  ElevatedButton _buildBtn(IconData icon, String text, VoidCallback handler) {
    return ElevatedButton.icon(
      onPressed: handler,
      icon: Icon(icon),
      label: Text(text),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
    );
  }
}
