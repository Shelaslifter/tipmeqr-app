import 'package:flutter/material.dart';
import 'package:tipmeqr_app/screens/splash_screen.dart';
// Importamos el archivo de la pantalla de login que acabamos de crear

void main() {
  runApp(const TipMeQRApp());
}

class TipMeQRApp extends StatelessWidget {
  const TipMeQRApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TipMeQR',
      // Mantenemos el tema oscuro que ya teníamos
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF121212),
      ),
      // ¡Aquí está el cambio! La pantalla de inicio ahora es LoginScreen
      home: const SplashScreen(),
    );
  }
}