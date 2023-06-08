import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:permission_handler/permission_handler.dart';

Future<File> generateAndPrintArabicPdf() async {
  final Document pdf = Document();
  var arabicFont =
      Font.ttf(await rootBundle.load("lib/assets/fonts/cairo-regular.ttf"));
  pdf.addPage(Page(
      theme: ThemeData.withFont(
        base: arabicFont,
      ),
      pageFormat: PdfPageFormat.roll80,
      build: (Context context) {
        return Center(
            child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Directionality(
              textDirection: TextDirection.rtl,
              child: Center(
                child: Text(
                  '    نص للتجربة نص للتجربة نص للتجربة تيست',
                  style: const TextStyle(
                    fontSize: 10,
                  ),
                ),
              ),
            ),
                  Directionality(
                      textDirection: TextDirection.rtl,
                      child: Center(
                          child: Text('الفرع : ', style: TextStyle(
                            fontSize: 10,
                          ))
                      )
                  ),
                ]
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Directionality(
                      textDirection: TextDirection.rtl,
                      child: Center(
                          child: Text(
                              '  01231324234  ', style: TextStyle(
                            fontSize: 10,
                          ))
                      )
                  ),
                  Directionality(
                      textDirection: TextDirection.rtl,
                      child: Center(
                          child: Text('الرقم الضريبي : ', style: TextStyle(
                            fontSize: 10,
                          ))
                      )
                  ),
                ]
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Directionality(
                      textDirection: TextDirection.rtl,
                      child: Center(
                          child: Text(
                              '  حي الخليج - الرياض ', style: TextStyle(
                            fontSize: 10,
                          ))
                      )
                  ),
                  Directionality(
                      textDirection: TextDirection.rtl,
                      child: Center(
                          child: Text('الموقع : ', style: TextStyle(
                            fontSize: 10,
                          ))
                      )
                  ),
                ]
            ),

            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Directionality(
                      textDirection: TextDirection.rtl,
                      child: Center(
                          child: Text(
                              '  0123456789 ', style: TextStyle(
                            fontSize: 10,
                          ))
                      )
                  ),
                  Directionality(
                      textDirection: TextDirection.rtl,
                      child: Center(
                          child: Text('هاتف : ', style: TextStyle(
                            fontSize: 10,
                          ))
                      )
                  ),
                ]
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Directionality(
                      textDirection: TextDirection.rtl,
                      child: Center(
                          child: Text(
                              '  1  ', style: TextStyle(
                            fontSize: 10,
                          ))
                      )
                  ),
                  Directionality(
                      textDirection: TextDirection.rtl,
                      child: Center(
                          child: Text('رقم الفاتورة : ', style: TextStyle(
                            fontSize: 10,
                          ))
                      )
                  ),
                ]
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Directionality(
                      textDirection: TextDirection.rtl,
                      child: Center(
                          child: Text(
                              '  خالد  ', style: TextStyle(
                            fontSize: 10,
                          ))
                      )
                  ),
                  Directionality(
                      textDirection: TextDirection.rtl,
                      child: Center(
                          child: Text('اسم العميل : ', style: TextStyle(
                            fontSize: 10,
                          ))
                      )
                  ),
                ]
            ),

            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Directionality(
                      textDirection: TextDirection.rtl,
                      child: Center(
                          child: Text(
                              '  0506040215 ', style: TextStyle(
                            fontSize: 10,
                          ))
                      )
                  ),
                  Directionality(
                      textDirection: TextDirection.rtl,
                      child: Center(
                          child: Text('رقم هاتف العميل : ', style: TextStyle(
                            fontSize: 10,
                          ))
                      )
                  ),
                ]
            ),

            Directionality(
                textDirection: TextDirection.rtl,
                child: Text('المشتريات' , style: TextStyle(
                    fontSize: 10
                ))
            ),
            Container(
              margin: EdgeInsets.fromLTRB(22, 5, 22, 5),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Table.fromTextArray(
                    headerStyle: TextStyle(
                        fontSize: 6
                    ),
                    headers: <dynamic>['الإجمالي', 'العدد' ,'الخدمة', 'القطعة'],
                    cellAlignment: Alignment.center,
                    cellStyle: TextStyle(
                        fontSize: 5
                    ),
                    data:  <List<dynamic>>[
                      <dynamic>['50', '10' ,'كوي', 'قميص' ],
                    ],
                ),
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Directionality(
                      textDirection: TextDirection.rtl,
                      child: Center(
                          child: Text(
                              '  50  ', style: TextStyle(
                            fontSize: 10,
                          ))
                      )
                  ),
                  Directionality(
                      textDirection: TextDirection.rtl,
                      child: Center(
                          child: Text('المجموع الفرعي : ', style: TextStyle(
                            fontSize: 10,
                          ))
                      )
                  ),
                ]
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Directionality(
                      textDirection: TextDirection.rtl,
                      child: Center(
                          child: Text(
                               '  -20  ',
                              style: TextStyle(
                                fontSize: 10,
                              ))
                      )
                  ),
                  Directionality(
                      textDirection: TextDirection.rtl,
                      child: Center(
                          child: Text('خصم العميل : ', style: TextStyle(
                            fontSize: 10,
                          ))
                      )
                  ),
                ]
            ),
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Directionality(
                      textDirection: TextDirection.rtl,
                      child: Center(
                          child: Text(
                              '  1  ', style: TextStyle(
                            fontSize: 10,
                          ))
                      )
                  ),
                  Directionality(
                      textDirection: TextDirection.rtl,
                      child: Center(
                          child: Text('خصم عددي : ', style: TextStyle(
                            fontSize: 10,
                          ))
                      )
                  ),
                ]
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Directionality(
                      textDirection: TextDirection.rtl,
                      child: Center(
                          child: Text(
                              '  29  ', style: TextStyle(
                            fontSize: 10,
                          ))
                      )
                  ),
                  Directionality(
                      textDirection: TextDirection.rtl,
                      child: Center(
                          child: Text('الإجمالي : ', style: TextStyle(
                            fontSize: 10,
                          ))
                      )
                  ),
                ]
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Directionality(
                      textDirection: TextDirection.rtl,
                      child: Center(
                          child: Text(
                               '  مدفوعة  ',
                              style: TextStyle(
                                fontSize: 10,
                              ))
                      )
                  ),
                  Directionality(
                      textDirection: TextDirection.rtl,
                      child: Center(
                          child: Text('حالة الفاتورة : ', style: TextStyle(
                            fontSize: 10,
                          ))
                      )
                  ),
                ]
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Directionality(
                      textDirection: TextDirection.rtl,
                      child: Center(
                          child: Text(
                              '  نقدا  ',
                              style: TextStyle(
                                fontSize: 10,
                              ))
                      )
                  ),
                  Directionality(
                      textDirection: TextDirection.rtl,
                      child: Center(
                          child: Text('طريقة الدفع : ', style: TextStyle(
                            fontSize: 10,
                          ))
                      )
                  ),
          ]),
        ]));
      }));
  var result = await Permission.storage. request();
 Directory? directory = await getExternalStorageDirectory();
          String newPath = "";
          print(directory);
          List<String> paths = directory!.path.split("/");
          for (int x = 1; x < paths.length; x++) {
            String folder = paths[x];
            if (folder != "Android") {
              newPath += "/" + folder;
            } else {
              break;
            }
          }
          newPath = newPath + "/ALWafeer";
          directory = Directory(newPath);
           await directory.create(recursive: true);

  final String dir = (await getApplicationSupportDirectory()).path;
  final String path = '$newPath/first.png';
  final File file = File(
    path,

  );

  Uint8List converToPdf = (await pdf.save());
  file.writeAsBytesSync(converToPdf);

  print('path ${file.path}');
  print('length ${await file.length()}');
  Uint8List fileContent = file.readAsBytesSync();

  print('File Content: $fileContent');

  // await Printing.layoutPdf(
  //     onLayout: (PdfPageFormat format) async => converToPdf);

  return file;
}
