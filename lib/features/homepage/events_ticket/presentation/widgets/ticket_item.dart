// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:alwafeer/core/utils/constants/assets_path.dart';

class TicketItem extends StatelessWidget {
  final DateTime day;
  final double price;
  final String note1;
  final String note2;
  final String note3;
  const TicketItem({
    Key? key,
    required this.day,
    required this.price,
    required this.note1,
    required this.note2,
    required this.note3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.purple.shade300,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Card(
          child: Container(
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildImage(),
                const SizedBox(
                  height: 8,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          _buildDate(context),
                          _buildTime(context),
                          _buildPrice(context)
                        ],
                      ),
                    ),
                    Divider(
                      height: 8,
                      color: Colors.grey.shade300,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildNotet1(),
                          Divider(
                            height: 8,
                            color: Colors.grey.shade300,
                          ),
                          _buildNote2(),
                          Divider(
                            height: 8,
                            color: Colors.grey.shade300,
                          ),
                          _buildNote3(),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _buildNote3() {
    return  Padding(
      padding:const EdgeInsets.only(top: 8.0),
      child: Text(
        note3,
        textAlign: TextAlign.center,
      ),
    );
  }

  Padding _buildNote2() {
    return  Padding(
      padding:const EdgeInsets.only(bottom: 8.0),
      child: Text(
        note2,
        textAlign: TextAlign.center,
        style: const TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }

  Padding _buildNotet1() {
    return  Padding(
      padding:const EdgeInsets.only(bottom: 8.0),
      child: Text(
        note1,
        textAlign: TextAlign.center,
        style: const TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }

  Expanded _buildPrice(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        Text(
          AppLocalizations.of(context)!.tickets_price_label,
          style:
              const TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
        ),
        Text(
          '${price.toStringAsFixed(2)} ${AppLocalizations.of(context)!.jordon_currency}',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        )
      ],
    ));
  }

  Expanded _buildTime(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        Text(
          AppLocalizations.of(context)!.tickets_timing_label,
          style:
              const TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
        ),
        Text(
          AppLocalizations.of(context)!.ticket_time_format(day),
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        )
      ],
    ));
  }

  Expanded _buildDate(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        Text(
          AppLocalizations.of(context)!.tickets_day_label,
          textAlign: TextAlign.center,
          style:
              const TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
        ),
        Text(
          AppLocalizations.of(context)!.ticket_date_format(day),
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        )
      ],
    ));
  }

  SizedBox _buildImage() {
    return SizedBox(
      width: double.infinity,
      child: Image.asset(
        AssetsPath.FREE_FIRE_GAME,
        fit: BoxFit.cover,
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var smallLineLength = size.width / 25;
    const smallLineHeight = 25;
    var path = Path();

    // path.lineTo(0, size.height);
    // for (int i = 1; i <= 25; i++) {
    //   if (i % 2 == 0) {
    //     path.lineTo(smallLineLength * i, size.height);
    //   } else {
    //     path.lineTo(smallLineLength * i, size.height - smallLineHeight);
    //   }
    // }
    // path.lineTo(size.width, 0);

    path.moveTo(0, 0);
    for (int i = 1; i <= 25; i++) {
      if (i % 2 != 0) {
        path.lineTo(smallLineLength * i, 0);
      } else {
        path.lineTo(smallLineLength * i, 25);
      }
    }
    // path.lineTo(0, size.height);
    // path.lineTo(0, size.height);
    //     path.lineTo(0, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper old) => false;
}
