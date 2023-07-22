import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final Function(String) onLogin;

  LoginScreen(this.onLogin);

  @override
  Widget build(BuildContext context) {
    String email = '';

    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio de Sesión'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
                if (email.isNotEmpty) {
                  bool isLoggedIn = onLogin(email);
                  if (isLoggedIn) {
                    // Navegar a la pantalla de bienvenida o la siguiente pantalla de tu aplicación
                    Navigator.pop(context);
                  } else {
                    // Mostrar mensaje de error
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Error'),
                        content: Text('El correo electrónico no está registrado.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                } else {
                  // Mostrar mensaje de error
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Error'),
                      content: Text('Por favor, ingresa tu correo electrónico.'),
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
              child: Text('Iniciar Sesión'),
            ),
          ],
        ),
      ),
    );
  }
}
