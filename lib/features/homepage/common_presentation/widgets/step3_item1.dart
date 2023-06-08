
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Step3Item1 extends StatelessWidget {
  final double unit;
  final double price;
  final String currency;
  final Color backgroundColor;
  final Color textColor;
  final Color currencyColor;
  final VoidCallback handler;
  const Step3Item1(
      {Key? key,
      required this.unit,
      required this.price,
      required this.currency,
      required this.backgroundColor,
      required this.textColor,
      required this.currencyColor,
      required this.handler})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) => InkWell(
        onTap: handler,
        child: Card(
          margin: const EdgeInsets.all(0),
          color: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: _buildContent(context, constraint),
        ),
      ),
    );
  }

  Container _buildContent(BuildContext context, BoxConstraints constraint) {
    return Container(
      padding: const EdgeInsets.all(4),
      alignment: Alignment.center,
      width: (constraint.maxWidth - 8) * 1 / 3,
      height: (constraint.maxWidth - 8) * 1 / 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildUnit(),
                _buildCurrency(),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          _buildPrice(context)
        ],
      ),
    );
  }

  Text _buildUnit() {
    return Text(
      '$unit',
      textAlign: TextAlign.center,
      style: TextStyle(height: 1, color: textColor, fontSize: 36),
    );
  }

  Text _buildCurrency() {
    return Text(
      currency,
      textAlign: TextAlign.center,
      style: TextStyle(height: 1, color: currencyColor, fontSize: 16),
    );
  }

  Container _buildPrice(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            child: Text(
              AppLocalizations.of(context)!.recharge_step3_price_label,
              style: TextStyle(
                color: textColor,
              ),
            ),
          ),
          FittedBox(
            child: Text(
              '$price $currency',
              style: TextStyle(
                color: textColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
