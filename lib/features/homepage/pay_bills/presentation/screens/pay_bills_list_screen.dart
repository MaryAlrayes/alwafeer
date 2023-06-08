import '../../../../../core/utils/constants/assets_path.dart';
import '../../data/basic_tile.dart';
import '../widgets/pay_bill_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PayBillsListScreen extends StatelessWidget {
  static const routeName = 'pay_bills_screen';
  const PayBillsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.pay_bills),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: ListView.separated(
          itemBuilder: (context, index) {
            return PayBillItem(
              title: BasicTile.getData(context)[index].title,
              icon: BasicTile.getData(context)[index].icon,
              children: BasicTile.getData(context)[index].subtitles,
            );
          },
          separatorBuilder: (context, index) => _buildDivider(),
          itemCount: BasicTile.getData(context).length),
    );
  }

  Divider _buildDivider() {
    return const Divider(
      height: 3,
      color: Colors.grey,
    );
  }
}
