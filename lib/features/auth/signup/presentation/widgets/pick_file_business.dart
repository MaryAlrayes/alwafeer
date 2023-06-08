import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PickFileBusiness extends StatefulWidget {
  const PickFileBusiness({super.key});

  @override
  State<PickFileBusiness> createState() => _PickFileBusinessState();
}

class _PickFileBusinessState extends State<PickFileBusiness> {
  String? pickedFile;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppLocalizations.of(context)!.commercial_register,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            ElevatedButton(
              onPressed: () async {
                final res = await FilePicker.platform.pickFiles();
                if (res == null) return;
                final _pickedFile = res.files.first;
                pickedFile = _pickedFile.name;
                setState(() {});
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange.shade400),
              child: Text(
                AppLocalizations.of(context)!.choose_file,
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Flexible(
                child: Text(
              pickedFile ?? '',
              style: const TextStyle(color: Colors.white),
            ))
          ],
        ),
      ],
    );
  }
}
