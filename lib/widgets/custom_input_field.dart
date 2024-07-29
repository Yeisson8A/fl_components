import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final IconData? icon;
  final TextInputType? keyboardType;
  final bool? isPassword;
  final String formProperty;
  final Map<String, String> formValues;

  const CustomInputField({
    super.key, 
    this.labelText, 
    this.hintText, 
    this.icon, 
    this.keyboardType, 
    this.isPassword, 
    required this.formProperty, 
    required this.formValues,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: TextCapitalization.words,
      keyboardType: keyboardType,
      obscureText: isPassword ?? false,
      autovalidateMode: AutovalidateMode.onUserInteraction, // Forma como se van a realizar las validaciones
      onChanged: (value) => formValues[formProperty] = value, // Capturar el valor ingresado en el campo
      validator: (value) { // Agregar validaciones al campo
        if (value == null) return 'Este campo es requerido';
        return value.length < 3 ? 'Mínimo de 3 carácteres' : null;
      },
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        icon: icon == null ? null : Icon(icon),
      ),
    );
  }
}