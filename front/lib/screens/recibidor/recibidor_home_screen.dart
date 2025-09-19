import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tipmeqr_app/screens/auth/login_screen.dart';
import 'detalle_campana_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Modelo simple para representar una campaña
class Campana {
  final String nombre;
  final String qrData;
  Campana({required this.nombre, required this.qrData});
}

class RecibidorHomeScreen extends StatefulWidget {
  const RecibidorHomeScreen({super.key});

  @override
  State<RecibidorHomeScreen> createState() => _RecibidorHomeScreenState();
}

class _RecibidorHomeScreenState extends State<RecibidorHomeScreen> {
  final _nombreCampanaController = TextEditingController();
  bool isLoading = false;

  final List<Campana> _campanas = [];

  // MEJORA: La función ahora está preparada para recibir la llamada real a la API.
  // Reemplaza tu función actual con esta:
    Future<void> _crearNuevaCampana() async {
  if (_nombreCampanaController.text.isEmpty) {
    // ... (el código de validación se queda igual)
    return;
  }

  setState(() { isLoading = true; });

  // ¡LA URL DE TU API REAL!
  // Recuerda: 'http://10.0.2.2:8000' para emulador Android
  //           'http://TU_IP_LOCAL:8000' para teléfono físico
  const String apiUrl = 'http://localhost:8000/generar_qr.php';

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'nombreCampana': _nombreCampanaController.text}),
    ).timeout(const Duration(seconds: 15)); // Añadimos un timeout más largo

    if (response.statusCode == 200 && mounted) {
      final responseData = json.decode(response.body);
      if (responseData['status'] == 'success') {
        final nuevaCampana = Campana(
          nombre: _nombreCampanaController.text,
          qrData: responseData['paymentUrl'], // ¡La URL de pago real!
        );
        setState(() {
          _campanas.insert(0, nuevaCampana);
          _nombreCampanaController.clear();
        });

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetalleCampanaScreen(
            nombreCampana: nuevaCampana.nombre,
            qrData: nuevaCampana.qrData,
          )),
        );
      } else {
        // Manejar un error devuelto por el PHP
         print('Error del backend: ${responseData['message']}');
      }
    } else {
      // Manejar un error del servidor HTTP
      print('Error del servidor: ${response.body}');
    }
  } catch (e) {
    // Manejar un error de conexión o timeout
    print('Error de conexión: $e');
  } finally {
    if (mounted) {
      setState(() { isLoading = false; });
    }
  }

  FocusScope.of(context).unfocus();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Mis Campañas'),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              tooltip: 'Cerrar Sesión',
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setBool('isLoggedIn', false);
                if (context.mounted) {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                    (Route<dynamic> route) => false,
                  );
                }
              },
            ),
          ],
        ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // --- Formulario para crear campaña ---
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text('Crear Nueva Campaña', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _nombreCampanaController,
                      decoration: const InputDecoration(
                        labelText: 'Nombre de la Campaña',
                        hintText: 'Ej: Ayuda para damnificados',
                      ),
                      // MEJORA: Permite crear la campaña al presionar "listo" en el teclado.
                      onSubmitted: (_) => _crearNuevaCampana(),
                    ),
                    const SizedBox(height: 16),
                    if (isLoading) const CircularProgressIndicator() else ElevatedButton.icon(
                      onPressed: _crearNuevaCampana,
                      icon: const Icon(Icons.add_circle_outline),
                      label: const Text('Crear y Generar QR'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: Colors.teal,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),
            
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Campañas Activas', style: TextStyle(fontSize: 18, color: Colors.grey))
            ),
            const Divider(),

            // MEJORA: Añadimos un mensaje por si la lista está vacía.
            if (_campanas.isEmpty && !isLoading)
              const Expanded(
                child: Center(
                  child: Text(
                    'Aún no has creado ninguna campaña.',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ),
              )
            else
              Expanded(
                child: ListView.builder(
                  itemCount: _campanas.length,
                  itemBuilder: (context, index) {
                    final campana = _campanas[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        leading: const Icon(Icons.campaign_rounded, color: Colors.tealAccent, size: 30),
                        title: Text(campana.nombre, style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: const Text('Toca para ver detalles y QR'),
                        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DetalleCampanaScreen(
                              nombreCampana: campana.nombre,
                              qrData: campana.qrData,
                            )),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}