import 'package:flutter/material.dart';
import 'auth/role_selection_screen.dart';

class HomeNavigatorScreen extends StatelessWidget {
  const HomeNavigatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Esta pantalla simplemente muestra la selección de rol como su contenido.
    return const RoleSelectionScreen();
  }
}