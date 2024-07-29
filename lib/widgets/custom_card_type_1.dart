import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CustomCardType1 extends StatelessWidget {
  const CustomCardType1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const ListTile(
            title: Text('Soy un título'),
            subtitle: Text('Esto es una descripción de ejemplo para una tarjeta en Flutter.'),
            leading: Icon(Icons.camera_alt_outlined, color: AppTheme.primary,),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {}, 
                  child: const Text('Cancel')
                ),
                TextButton(
                  onPressed: () {}, 
                  child: const Text('Ok')
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}