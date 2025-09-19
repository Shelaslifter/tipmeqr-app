import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tipmeqr_app/screens/auth/egister_donador_screen.dart';

// Importamos las pantallas necesarias para la navegación
import '../home_navigator_screen.dart';
import 'register_org_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // --- Título de la App ---
                const Text(
                  'Bienvenido a\nTipMeQR',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Inicia sesión para continuar',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[400],
                  ),
                ),
                const SizedBox(height: 50),

                // --- Campo de Texto para Email ---
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Correo Electrónico',
                    prefixIcon: Icon(Icons.email_outlined, color: Colors.grey[400]),
                    filled: true,
                    fillColor: Colors.grey.shade800.withOpacity(0.5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // --- Campo de Texto para Contraseña ---
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    prefixIcon: Icon(Icons.lock_outline, color: Colors.grey[400]),
                    filled: true,
                    fillColor: Colors.grey.shade800.withOpacity(0.5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                // --- Botón de Iniciar Sesión ---
                ElevatedButton(
                  onPressed: () async {
                    // Guardamos en la memoria del teléfono que el usuario ha iniciado sesión
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setBool('isLoggedIn', true);

                    // Navegamos a la pantalla principal
                    if (context.mounted) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const HomeNavigatorScreen()),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Iniciar Sesión',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),

                // --- Texto para Registrarse (CORREGIDO) ---
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '¿No tienes una cuenta? ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextButton(
                      onPressed: () {
                        // Mostramos un diálogo para que elija el tipo de registro
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Tipo de Cuenta'),
                              content: const Text('¿Qué tipo de cuenta deseas crear?'),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Donador'),
                                  onPressed: () {
                                    Navigator.of(context).pop(); // Cierra el diálogo
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const RegisterDonadorScreen()),
                                    );
                                  },
                                ),
                                TextButton(
                                  child: const Text('Organización'),
                                  onPressed: () {
                                    Navigator.of(context).pop(); // Cierra el diálogo
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const RegisterOrgScreen()),
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: const Text(
                        'Regístrate',
                        style: TextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}