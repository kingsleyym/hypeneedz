import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  BarcodeScreenState createState() => BarcodeScreenState();
}

class BarcodeScreenState extends State<UserPage> {
  String _barcode = '';

  Future<void> _scanBarcode() async {
    String barcode = await FlutterBarcodeScanner.scanBarcode(
      '#ff6666', // Farbe des Scanners
      'Abbrechen', // Text zum Abbrechen des Scanvorgangs
      false, // Animation des Scanners
      ScanMode.BARCODE, // Scanmodus
    );

    setState(() {
      _barcode = barcode;
    });
  }

  Future<void> _takePhoto() async {
    final cameras = await availableCameras();
    final frontCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back);

    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      final appDir = await getApplicationDocumentsDirectory();
      final fileName = '${DateTime.now()}.jpg';
      final File savedImage = File('${appDir.path}/$fileName');

      await savedImage.writeAsBytes(await image.readAsBytes());

      setState(() {
        _barcode = 'Verarbeite Bild...';

        // Barcode aus dem Bild extrahieren
        // Hier kannst du die entsprechende Barcode-Erkennungsbibliothek deiner Wahl verwenden
        // In diesem Beispiel verwenden wir keine Bibliothek, sondern zeigen nur den Dateinamen an
        _barcode = savedImage.path.split('/').last;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barcode Scanner'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Barcode:',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              _barcode,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _scanBarcode,
              child: const Text('Barcode scannen'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _takePhoto,
              child: const Text('Foto aufnehmen'),
            ),
          ],
        ),
      ),
    );
  }
}
