import 'package:flutter/material.dart';
import 'package:tipmeqr_app/screens/donador/donador_home_screen.dart';
import 'package:tipmeqr_app/screens/recibidor/recibidor_home_screen.dart';



class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtenemos el tema actual para usar sus colores
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '¿Cuál es tu rol?',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Elige cómo quieres usar la aplicación.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[400],
                  ),
                ),
                const SizedBox(height: 50),

                // --- Tarjeta para la Organización (Recibidor) ---
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: InkWell( // Hace que la tarjeta sea clickeable
                   onTap: () {
                      Navigator.push( // Correcto, usamos 'push'
                        context,
                        MaterialPageRoute(builder: (context) => const RecibidorHomeScreen()),
                      );
                    },
                    borderRadius: BorderRadius.circular(15),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ListTile(
                        leading: Icon(Icons.business_rounded, color: theme.colorScheme.primary, size: 40),
                        title: const Text('Soy una Organización', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                        subtitle: const Text('Genera QR para recibir donaciones.'),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // --- Tarjeta para el Donador ---
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: InkWell(
                    onTap: () {
                      // TODO: Navegar al dashboard del donador
                      Navigator.push( // Usamos pushReplacement para que no pueda volver al login
                        context,
                        MaterialPageRoute(builder: (context) => const DonadorHomeScreen()),
                      );
                    },
                    borderRadius: BorderRadius.circular(15),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ListTile(
                        leading: Icon(Icons.volunteer_activism_rounded, color: theme.colorScheme.secondary, size: 40),
                        title: const Text('Quiero Donar', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                        subtitle: const Text('Escanea un QR para apoyar una causa.'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}