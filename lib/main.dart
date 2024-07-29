import 'package:flutter/material.dart';
import 'package:fl_components/theme/app_theme.dart';
import 'package:fl_components/router/app_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: AppRoutes.initialRoute, // Ruta inicial
      routes: AppRoutes.getAppRoutes(), // Definición de rutas
      onGenerateRoute: AppRoutes.onGenerateRoute, // Trabajar con rutas dinámicas
      theme: AppTheme.lightTheme,
    );
  }
}