import 'package:app_reconciliacion/Components/button.dart';
import 'package:app_reconciliacion/Components/colors.dart';
import 'package:app_reconciliacion/Components/textfield.dart';
import 'package:app_reconciliacion/Views/mis_eventos.dart';
import 'package:app_reconciliacion/Views/registro.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/image/logo_reconciliacion.png',
                  width: 150,
                  height: 150,
                ),

                const SizedBox(height: 60),
                const Text('Iniciar Sesión',
                    style:
                        TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),

                const SizedBox(height: 10),
                const Text('Email',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                InputField(
                  hint: 'example@gmail.com',
                  icon: Icons.email,
                  controller: email,
                ),

                const SizedBox(height: 10),
                const Text('Contraseña',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                InputField(
                  hint: '********',
                  icon: Icons.lock,
                  controller: password,
                  passwordInvisible: true,
                ),

                const SizedBox(height: 10),
                // Our login button
                Button(
                  label: 'INGRESAR',
                  press: () {
                    // Validar que los campos no estén vacíos
                    if (email.text.isEmpty || password.text.isEmpty) {
                      // Campos vacíos, mostrar alerta
                      _showEmptyFieldsAlert();
                    } else {
                      // Campos no vacíos, navegar a MisEventos
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MisEventos()),
                      );
                    }
                  },
                ),

                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('¿No tienes una cuenta?',
                        style: TextStyle(fontSize: 18)),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignupScreen()),
                        );
                      },
                      child: const Text('Registrate',
                          style: TextStyle(color: primaryColorM, fontSize: 18)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //Si los campos se encuentran vacios se mostrara esta ventana
  void _showEmptyFieldsAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Campos Vacíos'),
          content: const Text('Por favor, ingrese su email y contraseña.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
