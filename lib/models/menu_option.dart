import 'package:flutter/material.dart' show IconData, Widget; // Se usa el show para no importar el paquete completo

class MenuOption {
  final String route;
  final IconData icon;
  final String name;
  final Widget screen;

  MenuOption({
    required this.route, 
    required this.icon, 
    required this.name, 
    required this.screen
  });
}