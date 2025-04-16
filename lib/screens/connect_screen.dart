import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:locksee/screens/send_qr.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../controller/home_screen_controller.dart';
import '../utils/AppColors.dart';
import '../utils/SecureStorageService.dart';
import '../utils/SocketService.dart';






import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:io';




class ConnectScreen extends StatefulWidget {
  @override
  _ConnectScreenState createState() => _ConnectScreenState();
}

class _ConnectScreenState extends State<ConnectScreen> {



  final GlobalKey globalKey = GlobalKey();

  Future<void> _shareQrCode(BuildContext context) async {
    try {
      // Convert QR to image
      RenderRepaintBoundary boundary = globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      // Save to file
      final directory = await getTemporaryDirectory();
      final path = '${directory.path}/my_qr.png';
      File imgFile = File(path);
      await imgFile.writeAsBytes(pngBytes);

      // Share
      await Share.shareFiles([path], text: 'Scan this QR Code');
    } catch (e) {
      print('Error generating QR: $e');
    }
  }



  String qrData = "67d95e0aa8fbda2fa12c151a"; // Sample QR Data

  void _scanQRCode(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QRScannerScreen()),
    );
  }

  final SecureStorageService storageService = SecureStorageService();




  var userId;
  void initState() {

    // initSocket();


    WidgetsBinding.instance.addPostFrameCallback((_) async {
      userId = (await storageService.getUserId())!;
      print("UserId: $userId");


      if (mounted) {
        setState(() {});  // Only update UI if widget is still in tree
      }



    });

    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   title: const Text(
      //     "Connect",
      //     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
      //   ),
      //   centerTitle: false,
      // ),
      body: Container(


        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background_image.png'), // your image path
            fit: BoxFit.cover, // or BoxFit.fill / BoxFit.contain
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [



            const SizedBox(height: 100),

            Row(
           children: [
             const SizedBox(width: 10),

             // Icon(Icons.arrow_back_ios_new,size: 30,),
             const SizedBox(width: 20),

             Text(
                "Connect",

                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
              ),
           ],
         ),
            const SizedBox(height: 80),
            // QR Code

            //userId!=""?
            Container(
              padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                   color: AppColor.whitecolor,
                  borderRadius: BorderRadius.circular(30),


                ),
              child:



              RepaintBoundary(
                key: globalKey,



              child:
              QrImageView(
                backgroundColor: AppColor.whitecolor,
                foregroundColor: AppColor.blackColor,
                data: userId??"",
                version: QrVersions.auto,
                size: 200,
              ),

              //
              //
              // QrImageView(
              //   data: qrData,
              //   version: QrVersions.auto,
              //   backgroundColor: AppColor.appColor,
              //   foregroundColor: AppColor.whitecolor,
              //   errorStateBuilder: (cxt, err) {
              //     return Center(
              //       child: Text(
              //         'Uh oh! Something went wrong...',
              //         textAlign: TextAlign.center,
              //       ),
              //     );
              //   },
              // )





              )
            ),
            const SizedBox(height: 10),
            const Text(
textAlign: TextAlign.center,
              'Scan your QR code so others can\n follow you',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _iconButton(Icons.search, 'Web Scan'),
                const SizedBox(width: 20),
                InkWell(
                    onTap: () => _scanQRCode(context),


                    child: _iconButton(Icons.qr_code_scanner, 'Scan QR')),


                const SizedBox(width: 20),

                InkWell(
                    onTap: () => _shareQrCode(context),
                    child: _iconButton(Icons.share, 'Share')),



              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(

              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 14),
              ),
              onPressed: ()
              {

                Get.to(QrSharePage());



              },
              child: const Text(
                'Manual QR',
                style: TextStyle(fontSize: 16, color: AppColor.appColor),
              ),
            ),

            const SizedBox(height: 20),


            // ElevatedButton(
            //   onPressed: () => _scanQRCode(context),
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.black,
            //     foregroundColor: Colors.white,
            //     padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            //   ),
            //   child: const Text("Scan QR"),
            //
            //
            // )

          ],
        ),
      ),


    );
  }


  Widget _iconButton(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 28, color: Colors.black),
        ),
        const SizedBox(height: 8),
        Text(
          textAlign: TextAlign.center,


            label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }

}


class QRScannerScreen extends StatefulWidget {
  @override
  QRScannerState createState() => QRScannerState();
}

class QRScannerState extends State<QRScannerScreen> {


  final MobileScannerController controller = MobileScannerController();

  //late IO.Socket socket;
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> chatHistory = [];


  late IO.Socket socket;


  final SecureStorageService storageService = SecureStorageService();

  SocketService socketService = SocketService( );

  var userId;

  // void initSocket() {
  //   socket = IO.io(
  //     "http://13.201.73.225:8000",
  //     IO.OptionBuilder()
  //         .setTransports(['websocket'])
  //         .setQuery({'userId': '67d95e0aa8fbda2fa12c151a'})
  //         .build(),
  //   );
  //
  //   socket.onConnect((_) {
  //     print("Connected to Socket Server");
  //     fetchUserChats();
  //   });
  //
  //   socket.on('userChats', (chats) {
  //     print('Received Chat List:   $chats');
  //
  //     if (chats is List) {
  //       setState(() {
  //         chatHistory = chats.cast<Map<String, dynamic>>();
  //
  //
  //
  //       });
  //     }
  //   });
  //
  //   // socket.on('newMessage', (chats) {
  //   //   print("New Message: $chats");
  //   //
  //   //   setState(() {
  //   //     chatHistory = chats.cast<Map<String, dynamic>>();
  //   //   });
  //   //
  //   //
  //   //
  //   //
  //   // });
  //
  //
  //   // socket.on('newMessage', (message) {
  //   //   print("New Message: $message");
  //   //
  //   //   if (message is Map<String, dynamic>) {
  //   //     setState(() {
  //   //       chatHistory.insert(0, message); // Insert at the beginning
  //   //     });
  //   //   } else {
  //   //     print("Unexpected message format: $message");
  //   //   }
  //   // });
  //   //
  //
  //
  //
  //
  //
  //   socket.on('newMessage', (message) {
  //     print("New Message: $message");
  //
  //     if (message is Map<String, dynamic> && message.containsKey('senderId')) {
  //       setState(() {
  //         // Check if senderId already exists in chatHistory
  //         int existingIndex = chatHistory.indexWhere((chat) =>
  //         chat['_id'] == message['senderId']); // Matching senderId with existing chat's _id
  //
  //         if (existingIndex != -1) {
  //           // Update existing chat's lastMessage
  //           chatHistory[existingIndex]['lastMessage'] = message;
  //         } else {
  //           // If senderId is not found, create a new entry
  //           chatHistory.insert(0, {
  //             '_id': message['senderId'],
  //             'lastMessage': message,
  //           });
  //         }
  //       });
  //     } else {
  //       print("Unexpected message format: $message");
  //     }
  //   });
  //
  //
  //   socket.onDisconnect((_) => print('Disconnected from server'));
  //   socket.onConnectError((err) => print('Connection error: $err'));
  // }





  @override
  void initState() {

    // initSocket();



     WidgetsBinding.instance.addPostFrameCallback((_) async {
       userId = await storageService.getUserId();
       print("UserId: $userId");

       socket = socketService.getSocket();


     });

     super.initState();
  }



  void _sendMessage( String? value) {

      // Emit message to server
      socket.emit('sendMessage', {
        'text': "Hi",
        "senderId": userId,
        "receiverId": value,
        "status": "pending",
      });


      var map ={ 'text': 'Hi',
        "senderId": userId,
        "receiverId": value,
        "status": "pending"};


      print("map ${map}" );




  }



  bool _isScanning = true;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Scan QR Code")),
      body:

      // MobileScanner(
      //   controller: controller,
      //   onDetect: (capture) {
      //     final List<Barcode> barcodes = capture.barcodes;
      //     for (final barcode in barcodes) {
      //       if (barcode.rawValue != null) {
      //
      //
      //        /// _sendMessage(barcode.rawValue);
      //
      //
      //
      //
      //
      //         print("Scanned: ${barcode.rawValue}");
      //
      //
      //
      //         // if (mounted) {
      //         //   Navigator.pop(context);
      //         //   ScaffoldMessenger.of(context).showSnackBar(
      //         //     SnackBar(content: Text("Scanned: ${barcode.rawValue}")),
      //         //   );
      //         // }
      //
      //
      //
      //
      //       }
      //     }
      //   },
      // ),

      MobileScanner(
        controller: controller,
        onDetect: _onDetect,




      ),


















    );
  }


  void _onDetect(BarcodeCapture capture) {
    if (!_isScanning) return;

    final barcodes = capture.barcodes;
    for (final barcode in barcodes) {
      final value = barcode.rawValue;
      if (value != null) {
        _isScanning = false; // prevent multiple scans
        print('Scanned: $value');





       _sendMessage(value);





        // Optional: Show snackbar
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(content: Text('Scanned: $value')),
        // );

        // Optional: Close scanner and return data
        Future.delayed(Duration(seconds: 1), () {
          Navigator.pop(context, value);
          Get.find<HomeController>().pageIndex.value = 0;


          // Return scanned result
        });

        break;
      }
    }
  }

}






















//////////////////









//
// import 'package:flutter/material.dart';
// import 'package:locksee/utils/AppColors.dart';
// import 'package:qr_flutter/qr_flutter.dart';
//
//
// class ConnectScreen extends StatelessWidget {
//   const ConnectScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Connect', style: TextStyle(color: Colors.black)),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {},
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Text(
//             'Waqar chaudhary',
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 10),
//           Stack(
//             alignment: Alignment.center,
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: AppColor.appColor,
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: QrImageView(
//                   data: 'https://example.com/user',
//                   version: QrVersions.auto,
//                   size: 180.0,
//                   backgroundColor:AppColor.appColor,
//                 ),
//               ),
//               // Positioned(
//               //   bottom: 16,
//               //   child: CircleAvatar(
//               //     radius: 28,
//               //     backgroundImage: AssetImage('assets/profile.jpg'), // Replace with network image if needed
//               //   ),
//               // ),
//             ],
//           ),
//           const SizedBox(height: 10),
//           const Text(
//             'Scan QR Code to connect',
//             style: TextStyle(fontSize: 14, color: Colors.grey),
//           ),
//           const SizedBox(height: 20),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               _iconButton(Icons.search, 'Search'),
//               const SizedBox(width: 20),
//               _iconButton(Icons.qr_code_scanner, 'Scan QR'),
//             ],
//           ),
//           const SizedBox(height: 20),
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.orange.shade300,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(24),
//               ),
//               padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 14),
//             ),
//             onPressed: () {},
//             child: const Text(
//               'Manual QR',
//               style: TextStyle(fontSize: 16, color: Colors.white),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _iconButton(IconData icon, String label) {
//     return Column(
//       children: [
//         Container(
//           padding: const EdgeInsets.all(10),
//           decoration: BoxDecoration(
//             color: Colors.grey.shade200,
//             shape: BoxShape.circle,
//           ),
//           child: Icon(icon, size: 28, color: Colors.black),
//         ),
//         const SizedBox(height: 8),
//         Text(label, style: const TextStyle(fontSize: 14)),
//       ],
//     );
//   }
// }
//











