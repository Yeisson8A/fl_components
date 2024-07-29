import 'package:flutter/material.dart';
import 'package:fl_components/theme/app_theme.dart';
import 'package:fl_components/router/app_routes.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final menuOptions = AppRoutes.menuOptions;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Componentes en Flutter'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          title: Text(menuOptions[index].name),
          leading: Icon(menuOptions[index].icon, color: AppTheme.primary,),
          onTap: () {
            // Navegación basada en el nombre de la ruta
            Navigator.pushNamed(context, menuOptions[index].route);
          },
        ), 
        separatorBuilder: (context, index) => const Divider(), 
        itemCount: menuOptions.length
      ),
    );
  }
}