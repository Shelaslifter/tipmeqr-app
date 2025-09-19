import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tipmeqr_app/screens/auth/login_screen.dart';

class DetalleCampanaScreen extends StatelessWidget {
  final String nombreCampana;
  final String qrData;

  const DetalleCampanaScreen({
    super.key,
    required this.nombreCampana,
    required this.qrData,
  });

  @override
  Widget build(BuildContext context) {
    // Datos simulados para la demo
    const double meta = 5000.0;
    const double recaudado = 2350.0;
    final double progreso = recaudado / meta;

    return Scaffold(
      appBar: AppBar(
          title: const Text('Mis Campañas'),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              tooltip: 'Cerrar Sesión',
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setBool('isLoggedIn', false); // Borramos el estado
                if (context.mounted) {
                  // Volvemos al login y borramos todo el historial de navegación
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                    (Route<dynamic> route) => false,
                  );
                }
              },
            ),
          ],
        ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Text(
              '¡Comparte este QR para recibir donaciones!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey[400]),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: QrImageView(
                data: qrData,
                version: QrVersions.auto,
                size: 220.0,
              ),
            ),
            const SizedBox(height: 40),

            // --- Barra de Progreso ---
            Text(
              '€${recaudado.toStringAsFixed(2)} / €${meta.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: progreso,
              minHeight: 10,
              borderRadius: BorderRadius.circular(5),
              backgroundColor: Colors.grey.shade800,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.teal),
            ),
            const SizedBox(height: 40),

            // --- Lista de Donaciones Recientes (Simulada) ---
            const Text(
              'Donaciones Recientes',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const ListTile(
              leading: Icon(Icons.favorite, color: Colors.pinkAccent),
              title: Text('Leonardo V. donó €20.00'),
              subtitle: Text('Hace 5 minutos'),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.favorite, color: Colors.pinkAccent),
              title: Text('Anónimo donó €5.00'),
              subtitle: Text('Hace 12 minutos'),
            ),
          ],
        ),
      ),
    );
  }
}