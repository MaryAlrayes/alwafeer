
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/ui/widgets/background.dart';
import '../widgets/delegate_info.dart';
import '../widgets/selling_info.dart';
import '../widgets/technical_support.dart';

class DelegateScreen extends StatelessWidget {
  static const routeName = 'delegate_Screen';
  const DelegateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const Background(),
      Padding(
        padding: const EdgeInsets.all(20.0).copyWith(top: 100),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildDelegateInfo(),
              const SizedBox(
                height: 16,
              ),
              _buildTechnicalSupportInfo(),
              const SizedBox(
                height: 16,
              ),

              _buildSellingTableInfo(context)
            ],
          ),
        ),
      )
    ]);
  }

  Widget _buildDelegateInfo() {
    return const DelegateInfo(name: 'محمد السلال', phoneNumber: '0798257975');
  }

  Widget _buildTechnicalSupportInfo() {
    return const TechnicalSupport(
        phoneNumber: '0595772994', email: 'example@gmail.com');
  }

  Widget _buildSellingTableInfo(BuildContext context) {
    List<String> columns = [
      AppLocalizations.of(context)!.name_column_field,
      AppLocalizations.of(context)!.balance_column_field,
      AppLocalizations.of(context)!.receivables_column_field
    ];
    List<UserSellingPoint> data = [
      UserSellingPoint(
          id: "1", name: 'سوبر ماركت 1', receivables: 200.00, profit: 100.00),
      UserSellingPoint(
          id: "2", name: 'سوبر ماركت 2', receivables: 250.00, profit: 1500.00),
      UserSellingPoint(
          id: "3", name: 'سوبر ماركت 3', receivables: 64.00, profit: 3.00),
      UserSellingPoint(
          id: "4", name: 'سوبر ماركت 4', receivables: 1.00, profit: 100.00),
      UserSellingPoint(
          id: "5", name: 'سوبر ماركت 5', receivables: 35.00, profit: 65.00),
      UserSellingPoint(
          id: "", name: 'سوبر ماركت 6', receivables: 12.00, profit: 45.00),
    ];
    return SellingInfo(columns: columns, data: data);
  }
}

class UserSellingPoint {
  final String id;
  final String name;
  final double receivables;
  final double profit;
  UserSellingPoint({
    required this.id,
    required this.name,
    required this.receivables,
    required this.profit,
  });
}
