import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
   
  const AlertScreen({super.key});

  // Función para mostrar dialogo para IOS
  void displayDialogIOS(BuildContext context) {
    showCupertinoDialog(
      context: context, 
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Titulo'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Este es el contenido de la alerta.'),
              SizedBox(height: 10,),
              FlutterLogo(size: 100,)
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // Volver a la última pantalla 
              child: const Text('Cancelar')
            )
          ],
        );
      },
    );
  }

  // Función para mostrar dialogo para android
  void displayDialogAndroid(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (context) {
        return AlertDialog(
          elevation: 5,
          title: const Text('Titulo'),
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(10)),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Este es el contenido de la alerta.'),
              SizedBox(height: 10,),
              FlutterLogo(size: 100,)
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // Volver a la última pantalla 
              child: const Text('Cancelar')
            )
          ],
        );
      },
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
         child: ElevatedButton(
          onPressed: () => Platform.isAndroid ? displayDialogAndroid(context) : displayDialogIOS(context), // Validar la plataforma al mostrar el dialogo
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Text('Mostrar alerta', style: TextStyle(fontSize: 18),),
          )
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.close, color: Colors.white,),
        onPressed: () => Navigator.pop(context) // Volver a la última pantalla
      ),
    );
  }
}