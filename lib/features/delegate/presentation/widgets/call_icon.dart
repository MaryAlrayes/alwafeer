import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CallIcon extends StatelessWidget {
  final String number;

  const CallIcon({Key? key, required this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        final url = 'tel:$number';
        if (await canLaunchUrlString(url)) {
          await launchUrlString(url);
        }
      },
      icon: const Icon(Icons.phone_in_talk_sharp,color: Colors.purple,),
    );
  }
}
