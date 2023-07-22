import 'package:flutter/material.dart';
import 'Screens/welcome_screen.dart';
import 'Models/user_model.dart';
import 'Screens/registration_screen.dart';
import 'Screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Lista de usuarios para simplificar el ejemplo (reemplazar con base de datos en una aplicación real)
  final List<User> users = [];
  //sobreescribir
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Rutas para las diferentes pantallas
      initialRoute: '/', // Ruta inicial, se muestra al iniciar la aplicación
      routes: {
        '/': (context) => WelcomeScreen(), // Pantalla de bienvenida como inicio
        '/registration': (context) => RegistrationScreen(registerUser),
        '/login': (context) => LoginScreen(loginUser),
      },
    );
  }

  // Función para registrar un nuevo usuario
  void registerUser(String name, String email) {
    users.add(User(name: name, email: email));
    // Aquí puedes agregar lógica adicional, como guardar en la base de datos o mostrar un mensaje de éxito
  }

  // Función para el inicio de sesión
  bool loginUser(String email) {
    return users.any((user) => user.email == email);
  }
}
