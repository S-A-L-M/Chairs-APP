import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  final Function(String, String) onRegister;

  RegistrationScreen(this.onRegister);

  @override
  Widget build(BuildContext context) {
    String name = '';
    String email = '';

    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Cuenta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (value) {
                name = value;
              },
              decoration: InputDecoration(
                labelText: 'Nombre',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              onChanged: (value) {
                email = value;
              },
              decoration: InputDecoration(
                labelText: 'Correo Electrónico',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (name.isNotEmpty && email.isNotEmpty) {
                  onRegister(name, email);
                  // Navegar a la pantalla de bienvenida o la siguiente pantalla de tu aplicación
                  Navigator.pop(context);
                } else {
                  // Mostrar mensaje de error
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Error'),
                      content: Text('Por favor, ingresa tu nombre y correo electrónico.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: Text('Registrarse'),
            ),
          ],
        ),
      ),
    );
  }
}
