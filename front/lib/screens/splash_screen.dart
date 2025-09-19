import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth/login_screen.dart'; // Tu pantalla de login
import 'home_navigator_screen.dart'; // Tu pantalla "base" después del login

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _verificarLogin();
  }

  Future<void> _verificarLogin() async {
    final prefs = await SharedPreferences.getInstance();
    // Buscamos en la memoria del teléfono si 'isLoggedIn' es true
    final bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    // Esperamos un segundo para que se vea el logo (opcional)
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) { // Verificamos que el widget todavía esté en pantalla
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => isLoggedIn
              ? const HomeNavigatorScreen() // Si está logueado, va al home
              : const LoginScreen(),     // Si no, va al login
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Pantalla de carga simple con tu logo o un spinner
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shield_rounded, size: 80, color: Colors.teal),
            SizedBox(height: 20),
            Text('TipMeQR', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}