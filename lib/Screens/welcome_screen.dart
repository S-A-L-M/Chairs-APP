import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  double _opacity = 0.0;
  double _padding = 100.0;

  @override
  void initState() {
    super.initState();
    _animateWelcome();
  }

  void _animateWelcome() {
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0;
        _padding = 20.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
        padding: EdgeInsets.all(_padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: _opacity,
              duration: Duration(seconds: 1),
              child: Text(
                '¡Bienvenido a TuApp!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navegar a la pantalla de registro
                Navigator.pushNamed(context, '/registration');
              },
              child: Text('Registrarse'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Navegar a la pantalla de inicio de sesión
                Navigator.pushNamed(context, '/login');
              },
              child: Text('Iniciar Sesión'),
            ),
          ],
        ),
      ),
    );
  }
}
