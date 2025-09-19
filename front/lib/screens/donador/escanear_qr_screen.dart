import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class EscanearQrScreen extends StatelessWidget {
  const EscanearQrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Escanear Código QR'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: MobileScanner(
        // controller: MobileScannerController(
        //   detectionSpeed: DetectionSpeed.noDuplicates, // Para no detectar el mismo QR múltiples veces
        // ),
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          if (barcodes.isNotEmpty) {
            final String? qrCodeData = barcodes.first.rawValue;
            if (qrCodeData != null) {
              // ¡QR Detectado! Cerramos la pantalla y devolvemos el dato.
              Navigator.pop(context, qrCodeData);
            }
          }
        },
      ),
    );
  }
}