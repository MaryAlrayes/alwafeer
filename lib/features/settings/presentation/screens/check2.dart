// import 'dart:async';
// import 'dart:io';

// import 'package:alwafeer/core/utils/constants/assets_path.dart';
// import 'package:blue_thermal_printer/blue_thermal_printer.dart';
// import 'package:esc_pos_bluetooth/esc_pos_bluetooth.dart';
// import 'package:esc_pos_utils/esc_pos_utils.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bluetooth_basic/flutter_bluetooth_basic.dart' as basic;
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:flutter_html/flutter_html.dart';
// import 'package:image/image.dart' as im;
// import 'package:screenshot/screenshot.dart';

// import '../../../../core/ui/widgets/snackbar.dart';
// import 'pdfTest.dart';

// class Check2 extends StatefulWidget {
//   const Check2({super.key});

//   @override
//   State<Check2> createState() => _Check2State();
// }

// class _Check2State extends State<Check2> {
//   final GlobalKey _key = GlobalKey();

//   BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;

//   PrinterBluetoothManager _printerManager = PrinterBluetoothManager();
//   basic.BluetoothManager bluetoothManager = basic.BluetoothManager.instance;
//   ScreenshotController screenshotController = ScreenshotController();
//   List<BluetoothDevice> _devices = [];
//   BluetoothDevice? selectedDevice;
//   bool _connected = false;

//   @override
//   void initState() {
//     super.initState();
//     initPlatformState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(AppLocalizations.of(context)!.check_printer),
//         backgroundColor: Colors.black,
//       ),
//       body: SafeArea(
//         child: Container(
//           padding: const EdgeInsets.only(top: 16),
//           child: Column(
//             children: [
//               // _buildWidgetToPrint(),
//               Row(
//                 children: [
//                   Expanded(
//                     child: ElevatedButton(
//                       child: const Text('طباعة'),
//                       onPressed: () async {
//                        // Uint8List file = await generateAndPrintArabicPdf();


//                         // ByteData bytesData = await rootBundle
//                         //     .load('lib/assets/images/login_logo.png');
//                         // String dir =
//                         //     (await getApplicationDocumentsDirectory()).path;
//                         // File imageFile =
//                         //     await File('$dir/mylogo.png').writeAsBytes(
//                         //   bytesData.buffer.asUint8List(
//                         //       bytesData.offsetInBytes, bytesData.lengthInBytes),
//                         // );

//                         // final im.Image? image = im.decodeImage(
//                         //   bytesData.buffer.asUint8List(
//                         //       bytesData.offsetInBytes, bytesData.lengthInBytes),
//                         // );

//                         // final String dir =
//                         //     (await getApplicationDocumentsDirectory()).path;
//                         // final String path = '$dir/1.pdf';
//                         // final File file = File(path);
//                         // Uint8List htmlToPrint = await Printing.convertHtml(
//                         //   html: _contentHtml,
//                         // );
//                         // File fileToPrint = await file.writeAsBytes(
//                         //   htmlToPrint.buffer.asUint8List(
//                         //       htmlToPrint.offsetInBytes,
//                         //       htmlToPrint.lengthInBytes),
//                         // );
//                         // print('length is ${await fileToPrint.length()}');
//                         // await Printing.layoutPdf(
//                         //     onLayout: (PdfPageFormat format) async =>
//                         //         htmlToPrint);

//                         // screenshotController
//                         //     .captureFromWidget(
//                         //   _buildWidgetToPrint(),
//                         //   context: context,
//                         // )
//                         //     .then((Uint8List capturedImage) async {
//                         //       ShowCapturedWidget(context, capturedImage);
//                         //   await _startPrint(file, capturedImage);
//                         // });
//                       },
//                     ),
//                   ),
//                   Expanded(
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: _connected ? Colors.red : Colors.green,
//                       ),
//                       child: Text(_connected ? 'قطع اتصال' : 'اتصال'),
//                       onPressed: () {
//                         _connected ? _disconnect() : _connect(context);
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 8,
//               ),
//               Text('${selectedDevice == null ? ' ' : selectedDevice!.name}'),
//               const SizedBox(
//                 height: 8,
//               ),
//               Expanded(
//                 child: ListView.separated(
//                   itemCount: _devices.length,
//                   separatorBuilder: (context, index) =>
//                       const SizedBox(height: 12),
//                   itemBuilder: (context, index) => ListTile(
//                     title: Text(_devices[index].name.toString()),
//                     onTap: () async {
//                       setState(() {
//                         selectedDevice = _devices[index];
//                       });
//                     },
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _connect(BuildContext context) {
//     if (selectedDevice != null) {
//       bluetooth.isConnected.then((isConnected) {
//         print('hi $isConnected');
//         if (isConnected != true) {
//           print('hiii');
//           bluetooth.connect(selectedDevice!).catchError((error) {
//             setState(() => _connected = false);
//           });
//           basic.BluetoothDevice otherDevice = basic.BluetoothDevice()
//             ..name = selectedDevice!.name
//             ..type = selectedDevice!.type
//             ..address = selectedDevice!.address
//             ..connected = selectedDevice!.connected;
//           _printerManager.selectPrinter(PrinterBluetooth(otherDevice));
//           print('after asign');
//           setState(() => _connected = true);

//           setState(() => _connected = true);
//         }
//       });
//     } else {
//       showSnackbar(context, 'No device selected.');
//     }
//   }

//   void _disconnect() {
//     bluetooth.disconnect();
//     setState(() => _connected = false);
//   }

//   Future<void> initPlatformState() async {
//     bool? isConnected = await bluetooth.isConnected;
//     print('isit $isConnected');
//     List<BluetoothDevice> devices = [];
//     try {
//       devices = await bluetooth.getBondedDevices();
//     } on PlatformException {}

//     bluetooth.onStateChanged().listen((state) {
//       switch (state) {
//         case BlueThermalPrinter.CONNECTED:
//           setState(() {
//             _connected = true;
//             print("bluetooth device state: connected");
//           });
//           break;
//         case BlueThermalPrinter.DISCONNECTED:
//           setState(() {
//             _connected = false;
//             print("bluetooth device state: disconnected");
//           });
//           break;
//         case BlueThermalPrinter.DISCONNECT_REQUESTED:
//           setState(() {
//             _connected = false;
//             print("bluetooth device state: disconnect requested");
//           });
//           break;
//         case BlueThermalPrinter.STATE_TURNING_OFF:
//           setState(() {
//             _connected = false;
//             print("bluetooth device state: bluetooth turning off");
//           });
//           break;
//         case BlueThermalPrinter.STATE_OFF:
//           setState(() {
//             _connected = false;
//             print("bluetooth device state: bluetooth off");
//           });
//           break;
//         case BlueThermalPrinter.STATE_ON:
//           setState(() {
//             _connected = false;
//             print("bluetooth device state: bluetooth on");
//           });
//           break;
//         case BlueThermalPrinter.STATE_TURNING_ON:
//           setState(() {
//             _connected = false;
//             print("bluetooth device state: bluetooth turning on");
//           });
//           break;
//         case BlueThermalPrinter.ERROR:
//           setState(() {
//             _connected = false;
//             print("bluetooth device state: error");
//           });
//           break;
//         default:
//           print(state);
//           break;
//       }
//     });

//     if (!mounted) return;
//     setState(() {
//       _devices = devices;
//     });

//     if (isConnected == true) {
//       setState(() {
//         _connected = true;
//       });
//     }
//   }

//   Future<dynamic> ShowCapturedWidget(
//       BuildContext context, Uint8List capturedImage) {
//     return showDialog(
//       useSafeArea: false,
//       context: context,
//       builder: (context) => Dialog(
//         child: capturedImage != null
//             ? Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Image.memory(
//                     capturedImage,
//                   ),
//                 ],
//               )
//             : Container(),
//       ),
//     );
//   }

//   Widget _buildWidgetToPrint() {
//     return Container(
//       color: Colors.white,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             alignment: Alignment.center,
//             child: Html(
//               data: """
//                   <h3>هذا النص للتجربة 1</h3>
//                   <center>
//                       <h3>هذا النص للتجربة2</h3>
//                       <center>
//                           <h3>هذا النص للتجربة 3</h3>
//                           <center>
//                               <h3>هذا النص للتجربة 4</h3>

//             """,
//             ),
//             // child: Text(' نص للتجربة نص للتجربة مانو html'),
//           ),
//         ],
//       ),
//     );
//   }

//   Future<void> _startPrint(File file, Uint8List capturedImage) async {
//     final profile = await CapabilityProfile.load();
//     final generator = Generator(PaperSize.mm80, profile);
//     List<int> bytes = [];
//     //ShowCapturedWidget(context, await file.readAsBytes());

//     final image1 = im.decodeImage(await file.readAsBytes());
//     final image2 = im.decodeImage(capturedImage);

//     bytes += (generator.text('First image1'));
//     if (image1 != null) {
//       bytes += (generator.text('First'));
//       bytes += (generator.image(image1));
//       bytes += (generator.text('Second'));
//       bytes += (generator.image(image1));
//       bytes += (generator.text('third'));
//       bytes += (generator.imageRaster(image1, imageFn: PosImageFn.graphics));
//     }
//     bytes += (generator.text('Second image1'));
//     if (image2 != null) {
//       bytes += (generator.text('First'));
//       bytes += (generator.image(image2));
//       bytes += (generator.text('Second'));
//       bytes += (generator.image(image2));
//       bytes += (generator.text('third'));
//       bytes += (generator.imageRaster(image2, imageFn: PosImageFn.graphics));
//     }
//     bytes += generator.feed(2);
//     bytes += generator.cut();
//     final result = await _printerManager.printTicket(bytes);

//     print(result);
//   }
// }
