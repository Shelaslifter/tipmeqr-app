import 'package:flutter/material.dart';
import 'escanear_qr_screen.dart';
import 'confirmacion_donacion_screen.dart';

class DonadorHomeScreen extends StatelessWidget {
  const DonadorHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel de Donador'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Tu Saldo', textAlign: TextAlign.center, style: TextStyle(fontSize: 20, color: Colors.grey)),
            const SizedBox(height: 8),
            const Text('€99,900.00', textAlign: TextAlign.center, style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
            const SizedBox(height: 60),
            ElevatedButton.icon(
              onPressed: () async {
                // Navegamos a la pantalla del escáner y esperamos un resultado
                final resultado = await Navigator.push<String>(
                  context,
                  MaterialPageRoute(builder: (context) => const EscanearQrScreen()),
                );

                // Si el escáner nos devolvió un dato (el contenido del QR)
                if (resultado != null && context.mounted) {
                  // Navegamos a la nueva pantalla de confirmación, pasándole los datos del QR
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConfirmacionDonacionScreen(datosDelQr: resultado),
                    ),
                  );
                }
              },
              icon: const Icon(Icons.camera_alt_outlined),
              label: const Text('Escanear QR para Donar'),

              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20),
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}