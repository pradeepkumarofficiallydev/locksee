import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:io';

class QrSharePage extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    final qrData = "https://trendysparepart.in"; // your referral URL or data

    return Scaffold(
      appBar: AppBar(title: Text("QR Share")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RepaintBoundary(
              key: globalKey,
              child:
              QrImageView(
                data: qrData,
                version: QrVersions.auto,
                size: 200.0,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _shareQrCode(context),
              child: Text("Share QR Code"),
            )
          ],
        ),
      ),
    );
  }
}


