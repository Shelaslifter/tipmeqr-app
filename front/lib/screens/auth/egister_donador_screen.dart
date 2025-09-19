import 'package:flutter/material.dart';

class RegisterDonadorScreen extends StatelessWidget {
  const RegisterDonadorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Donador'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Únete para apoyar causas',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 40),

                // --- Campos del Formulario ---
                const TextField(
                  decoration: InputDecoration(labelText: 'Nombre Completo'),
                ),
                const SizedBox(height: 20),
                const TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: 'Correo Electrónico'),
                ),
                const SizedBox(height: 20),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Contraseña'),
                ),
                const SizedBox(height: 30),

                // --- Botón para Subir Foto (Simulado) ---
                OutlinedButton.icon(
                  onPressed: () {
                    // TODO: Lógica para abrir la galería y seleccionar una imagen
                  },
                  icon: const Icon(Icons.upload_file_rounded),
                  label: const Text('Subir foto de INE (Opcional)'),
                  style: OutlinedButton.styleFrom(
                     padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
                const SizedBox(height: 40),

                // --- Botón de Registro ---
                ElevatedButton(
                  onPressed: () {
                    // TODO: Lógica para registrar al donador
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    'Crear Cuenta',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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