import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class InputsScreen extends StatelessWidget {
   
  const InputsScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
    final Map<String, String> formValues = {
      'first_name': '',
      'last_name': '',
      'email': '',
      'phone_number': '',
      'password': '',
      'role': ''
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs y Forms'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: myFormKey,
            child: Column(
              children: [
                CustomInputField(labelText: 'Nombre', hintText: 'Nombre del usuario', formProperty: 'first_name', formValues: formValues,),
                const SizedBox(height: 30),
                CustomInputField(labelText: 'Apellido', hintText: 'Apellido del usuario', formProperty: 'last_name', formValues: formValues,),
                const SizedBox(height: 30),
                CustomInputField(labelText: 'Correo', hintText: 'Correo del usuario', keyboardType: TextInputType.emailAddress, formProperty: 'email', formValues: formValues,),
                const SizedBox(height: 30),
                CustomInputField(labelText: 'Teléfono', hintText: 'Teléfono del usuario', keyboardType: TextInputType.phone, formProperty: 'phone_number', formValues: formValues,),
                const SizedBox(height: 30),
                CustomInputField(labelText: 'Contraseña', hintText: 'Contraseña del usuario', isPassword: true, formProperty: 'password', formValues: formValues,),
                const SizedBox(height: 30),
                // Lista desplegable
                DropdownButtonFormField(
                  decoration: const InputDecoration(labelText: 'Rol'),
                  items: const [
                    DropdownMenuItem(value: 'Admin', child: Text('Admin')),
                    DropdownMenuItem(value: 'Superuser', child: Text('Superuser')),
                    DropdownMenuItem(value: 'Developer', child: Text('Developer')),
                    DropdownMenuItem(value: 'Jr. Developer', child: Text('Jr. Developer'))
                  ], 
                  onChanged: (value) => formValues['role'] = value ?? 'Admin',
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  child: const SizedBox(width: double.infinity, height: 45, child: Center(child: Text('Guardar'))),
                  onPressed: () {
                    // Para cerrar el teclado al dar clic al botón
                    FocusScope.of(context).requestFocus(FocusNode());
                    // Para disparar las validaciones de los campos
                    if (!myFormKey.currentState!.validate()) {
                      print('Fórmulario no válido');
                      return;
                    }
                    print(formValues);
                  }, 
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}