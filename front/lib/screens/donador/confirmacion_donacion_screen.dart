import 'package:flutter/material.dart';


class ConfirmacionDonacionScreen extends StatefulWidget {
  final String datosDelQr;

  const ConfirmacionDonacionScreen({super.key, required this.datosDelQr});

  @override
  State<ConfirmacionDonacionScreen> createState() => _ConfirmacionDonacionScreenState();
}

class _ConfirmacionDonacionScreenState extends State<ConfirmacionDonacionScreen> {
  final _montoController = TextEditingController();

  void _confirmarDonacion() {
    // TODO: Aquí irá la lógica para procesar el pago en el futuro.
    // Por ahora, solo mostraremos un mensaje de éxito.

    Navigator.of(context).pop(); // Cierra la pantalla de confirmación
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('¡Gracias por tu donación!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmar Donación'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // --- Detalles de la Campaña (Simulados) ---
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Estás donando a:',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Campaña de Ayuda para Damnificados',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'ID de Campaña (del QR):\n${widget.datosDelQr}',
                        style: const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // --- Campo para el Monto ---
              TextField(
                controller: _montoController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: 'Monto a Donar',
                  prefixText: '€ ', // Símbolo de la moneda
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const Spacer(), // Empuja el botón hacia abajo

              // --- Botón de Confirmación ---
              ElevatedButton(
                onPressed: _confirmarDonacion,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                child: const Text('Confirmar y Donar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}