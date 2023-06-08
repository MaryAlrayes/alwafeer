import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_html_to_pdf/flutter_html_to_pdf.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:image/image.dart';
import 'package:image/image.dart' as im;
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

import '../../../../core/ui/widgets/snackbar.dart';

class CheckPrinterScreen extends StatefulWidget {
  const CheckPrinterScreen({super.key});

  @override
  State<CheckPrinterScreen> createState() => _CheckPrinterScreenState();
}

class _CheckPrinterScreenState extends State<CheckPrinterScreen> {
  final GlobalKey _key = GlobalKey();

  ScreenshotController screenshotController = ScreenshotController();
  BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;

  List<BluetoothDevice> _devices = [];
  BluetoothDevice? selectedDevice;
  bool _connected = false;


  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  @override
  Widget build(BuildContext myContext) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(myContext)!.check_printer),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            children: [
              _buildWidgetToPrint(),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      child: const Text('طباعة'),
                      onPressed: () async {
                        //  convert(_contentHtml, "File_Name");
                        //  File file = await generateAndPrintArabicPdf();

                        // ByteData bytesData =
                        //     await rootBundle.load(AssetsPath.LOGIN_ICON);

                        // String dir =
                        //     (await getApplicationDocumentsDirectory()).path;

                        // File imageFile =
                        //     await File('$dir/login_logo.png').writeAsBytes(
                        //   bytesData.buffer.asUint8List(
                        //       bytesData.offsetInBytes, bytesData.lengthInBytes),
                        // );

                        // final im.Image? image = im.decodeImage(
                        //   bytesData.buffer.asUint8List(
                        //       bytesData.offsetInBytes, bytesData.lengthInBytes),
                        // );

                        // final String dir =
                        //     (await getApplicationDocumentsDirectory()).path;
                        // final String path = '$dir/1.pdf';
                        // final File file = File(path);
                        // Uint8List htmlToPrint = await Printing.convertHtml(
                        //   html: _contentHtml,
                        // );
                        // File fileToPrint = await file.writeAsBytes(
                        //   htmlToPrint.buffer.asUint8List(
                        //       htmlToPrint.offsetInBytes,
                        //       htmlToPrint.lengthInBytes),
                        // );
                        // print('length is ${await fileToPrint.length()}');
                        // await Printing.layoutPdf(
                        //     onLayout: (PdfPageFormat format) async =>
                        //         htmlToPrint);

                        // bluetooth.isConnected.then((isConnected) {
                        //   print('about to print');
                        //   if (isConnected == true) {
                        //     bluetooth.printNewLine();
                        //     // bluetooth.printImage(imageFile.path);
                        //     bluetooth.printImageBytes(
                        //       file.buffer.asUint8List(
                        //         file.offsetInBytes,
                        //         file.lengthInBytes,
                        //       ),
                        //     );

                        //     bluetooth.printNewLine();
                        //     bluetooth.paperCut();
                        //   }
                        // });

                        // screenshotController
                        //     .captureFromWidget(
                        //   _buildWidgetToPrint(),
                        //   context: myContext,
                        // )
                        //     .then((Uint8List capturedImage) async {
                        //   ShowCapturedWidget(context, capturedImage);
                        //   print('image is ${capturedImage.lengthInBytes}');
                        //   bluetooth.isConnected.then((isConnected) {
                        //     if (isConnected == true) {
                        //       bluetooth.printImageBytes(
                        //         capturedImage.buffer.asUint8List(
                        //           capturedImage.offsetInBytes,
                        //           capturedImage.lengthInBytes,
                        //         ),
                        //       );
                        //       bluetooth.paperCut();
                        //     }
                        //   });
                        // });

                        screenshotController.capture().then((capturedImage) {
                          final newImage = resizeImage(capturedImage!);
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) =>
                          //         Test(capturedImage: newImage),
                          //   ),
                          // );

                          print('image is ${newImage.length}');
                          bluetooth.isConnected.then((isConnected) {
                            if (isConnected == true) {
                              bluetooth.printImageBytes(
                                newImage.buffer.asUint8List(
                                  newImage.offsetInBytes,
                                  newImage.lengthInBytes,
                                ),
                              );
                              bluetooth.paperCut();
                            }
                          });
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _connected ? Colors.red : Colors.green,
                      ),
                      child: Text(_connected ? 'قطع اتصال' : 'اتصال'),
                      onPressed: () {
                        _connected ? _disconnect() : _connect(myContext);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Text('${selectedDevice == null ? ' ' : selectedDevice!.name}'),
              const SizedBox(
                height: 8,
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: _devices.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
                  itemBuilder: (context, index) => ListTile(
                    title: Text(_devices[index].name.toString()),
                    onTap: () async {
                      setState(() {
                        selectedDevice = _devices[index];
                      });
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  convert(String cfData, String name) async {
    // Name is File Name that you want to give the file
    var targetPath = await _localPath;
    var targetFileName = name;

    var generatedPdfFile = await FlutterHtmlToPdf.convertFromHtmlContent(
      cfData,
      targetPath!,
      targetFileName,
    );
    File fileDef = File(targetPath);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(generatedPdfFile.toString()),
    ));
  }

  Future<String?> get _localPath async {
    Directory? directory;
    try {
      if (Platform.isIOS) {
        directory = await getApplicationSupportDirectory();
      } else {
        directory = await getApplicationSupportDirectory();
        if (!await directory.exists()) {
          directory = await getExternalStorageDirectory();
        }
      }
    } catch (err, stack) {
      print("Can-not get download folder path");
    }
    return directory?.path;
  }

  // Future<dynamic> ShowCapturedWidget(
  //     BuildContext context, Uint8List capturedImage) {
  //   return showDialog(
  //     useSafeArea: false,
  //     context: context,
  //     builder: (context) => Dialog(
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           Image.memory(
  //             capturedImage,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  void _connect(BuildContext context) {
    if (selectedDevice != null) {
      bluetooth.isConnected.then((isConnected) {
        if (isConnected == false) {
          bluetooth.connect(selectedDevice!).catchError((error) {
            setState(() => _connected = false);
          });
          setState(() => _connected = true);
        }
      });
    } else {
      showSnackbar(context, 'No device selected.');
    }
  }

  void _disconnect() {
    bluetooth.disconnect();
    setState(() => _connected = false);
  }

//   Future<Uint8List?> _CaptureScreenShot() async {
//     print('about to capture');
//     RenderRepaintBoundary bound =
//         _key.currentContext!.findRenderObject() as RenderRepaintBoundary;

// //if it coudn't take a screenshot
//     if (bound.debugNeedsPaint) {
//       Timer(const Duration(seconds: 1), () => _CaptureScreenShot());
//       return null;
//     }
//     showSnackbar(context, 'before debugNeedsPaint');
  // if (bound.debugNeedsPaint) {
  //   print("Waiting for boundary to be painted.");
  //   showSnackbar(context, 'Waiting for boundary to be painted.');
  //   await Future.delayed(
  //     const Duration(milliseconds: 20),
  //     () => _CaptureScreenShot(),
  //   );
  // }
//     showSnackbar(context, 'after debugNeedsPaint');
//     ui.Image image = await bound.toImage();
//     ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
//     if (byteData != null) {
//       Uint8List pngBytes = byteData.buffer.asUint8List();

//       ShareFilesAndScreenshotWidgets().shareScreenshot(
//           _key, 2000, "Title", "Name.png", "image/png",
//           text: "This is the caption!");
//       return pngBytes;
//     } else {
//       return null;
//     }
//   }

  Widget _buildWidgetToPrint() {
    return Screenshot(
      controller: screenshotController,
      child: Material(
        child: Container(
          //constraints: BoxConstraints(maxHeight: 300,maxWidth: 300),

//           child: const HtmlWidget(
//             '''
// <html>

// <body >
//   <p>مرحبا ، هذا نص للتجربة 1 طباعة</p>
//    <p>مرحبا ، هذا نص للتجربة2 طباعة</p>
//     <p>مرحبا ، هذا نص للتجربة3 طباعة</p>
//      <p>مرحبا ، هذا نص للتجربة4 طباعة</p>
//       <p>مرحبا ، هذا نص للتجربة5 طباعة</p>

// </body>

// </html>

//   ''',
//             textStyle: TextStyle(fontSize: 14, color: Colors.black),
//           ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 2),
                      ),
                      child: Center(
                          child: Column(children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Center(
                                child: Text(
                                  '    نص للتجربة نص للتجربة نص للتجربة تيست',
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  'الفرع : ',
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ]),
                        Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Center(
                                  child: Text('  01231324234  ',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ))),
                              Center(
                                  child: Text('الرقم الضريبي : ',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ))),
                            ]),
                        Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Center(
                                  child: Text('  حي الخليج - الرياض ',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ))),
                              Center(
                                  child: Text('الموقع : ',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ))),
                            ]),
                        Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Center(
                                  child: Text('  0123456789 ',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ))),
                              Center(
                                  child: Text('هاتف : ',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ))),
                            ]),
                        Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Center(
                                  child: Text('  1  ',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ))),
                              Center(
                                  child: Text('رقم الفاتورة : ',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ))),
                            ]),
                        Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Center(
                                  child: Text('  خالد  ',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ))),
                              Center(
                                  child: Text('اسم العميل : ',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ))),
                            ]),
                        Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Center(
                                  child: Text('  0506040215 ',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ))),
                              Center(
                                  child: Text('رقم هاتف العميل : ',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ))),
                            ]),
                        Text('المشتريات', style: TextStyle(fontSize: 10)),
                        Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Center(
                                  child: Text('  50  ',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ))),
                              Center(
                                  child: Text('المجموع الفرعي : ',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ))),
                            ]),
                        Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Center(
                                  child: Text('  -20  ',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ))),
                              Center(
                                  child: Text('خصم العميل : ',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ))),
                            ]),
                        Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Center(
                                  child: Text('  1  ',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ))),
                              Center(
                                  child: Text('خصم عددي : ',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ))),
                            ]),
                        // Row(
                        //     mainAxisSize: MainAxisSize.min,
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: const [
                        //       Center(
                        //           child: Text('  29  ',
                        //               style: TextStyle(
                        //                 fontSize: 10,
                        //               ))),
                        //       Center(
                        //           child: Text('الإجمالي : ',
                        //               style: TextStyle(
                        //                 fontSize: 10,
                        //               ))),
                        //     ]),
                        // Row(
                        //     mainAxisSize: MainAxisSize.min,
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: const [
                        //       Center(
                        //           child: Text('  مدفوعة  ',
                        //               style: TextStyle(
                        //                 fontSize: 10,
                        //               ))),
                        //       Center(
                        //           child: Text('حالة الفاتورة : ',
                        //               style: TextStyle(
                        //                 fontSize: 10,
                        //               ))),
                        //     ]),
                        // Row(
                        //     mainAxisSize: MainAxisSize.min,
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: const [
                        //       Center(
                        //           child: Text('  نقدا  ',
                        //               style: TextStyle(
                        //                 fontSize: 10,
                        //               ))),
                        //       Center(
                        //           child: Text('طريقة الدفع : ',
                        //               style: TextStyle(
                        //                 fontSize: 10,
                        //               ))),
                        //     ]),
                      ]))
                      //             child: Html(
                      //               data: """
                      //       `
                      //       <h3>هذا النص للتجربة 1</h3>
                      //       `
                      // """,
                      //             ),
                      ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Uint8List resizeImage(Uint8List data, {bool mm80 = false}) {
    try {
      final im.Image? img = im.decodeImage(data);
      final im.Image resized = copyResize(
        img!,
        width: mm80 ? 510 : 370,
      );
      return Uint8List.fromList(encodeJpg(resized));
    } catch (e) {
      if (kDebugMode) log('Error in resizing image $e');
      return data;
    }
  }

  Future<void> initPlatformState() async {
    bool? isConnected = await bluetooth.isConnected;
    print('isit $isConnected');
    List<BluetoothDevice> devices = [];
    try {
      devices = await bluetooth.getBondedDevices();
    } on PlatformException {}

    bluetooth.onStateChanged().listen((state) {
      switch (state) {
        case BlueThermalPrinter.CONNECTED:
          setState(() {
            _connected = true;
            print("bluetooth device state: connected");
          });
          break;
        case BlueThermalPrinter.DISCONNECTED:
          setState(() {
            _connected = false;
            print("bluetooth device state: disconnected");
          });
          break;
        case BlueThermalPrinter.DISCONNECT_REQUESTED:
          setState(() {
            _connected = false;
            print("bluetooth device state: disconnect requested");
          });
          break;
        case BlueThermalPrinter.STATE_TURNING_OFF:
          setState(() {
            _connected = false;
            print("bluetooth device state: bluetooth turning off");
          });
          break;
        case BlueThermalPrinter.STATE_OFF:
          setState(() {
            _connected = false;
            print("bluetooth device state: bluetooth off");
          });
          break;
        case BlueThermalPrinter.STATE_ON:
          setState(() {
            _connected = false;
            print("bluetooth device state: bluetooth on");
          });
          break;
        case BlueThermalPrinter.STATE_TURNING_ON:
          setState(() {
            _connected = false;
            print("bluetooth device state: bluetooth turning on");
          });
          break;
        case BlueThermalPrinter.ERROR:
          setState(() {
            _connected = false;
            print("bluetooth device state: error");
          });
          break;
        default:
          print(state);
          break;
      }
    });

    if (!mounted) return;
    setState(() {
      _devices = devices;
    });

    if (isConnected == true) {
      setState(() {
        _connected = true;
      });
    }
  }
}
