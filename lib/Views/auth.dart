import 'package:app_reconciliacion/Components/button.dart';
import 'package:app_reconciliacion/Components/button_nav.dart';
import 'package:app_reconciliacion/Components/textfield.dart';
import 'package:app_reconciliacion/Views/login.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Image.asset('assets/image/logo_reconciliacion.png')),
                const Text(
                  'Iniciar Sesión',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                const Text('Email'),
                Button(
                    label: 'INGRESAR',
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
