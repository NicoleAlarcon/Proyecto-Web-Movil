import 'package:app_reconciliacion/Components/button.dart';
import 'package:app_reconciliacion/Components/colors.dart';
import 'package:app_reconciliacion/Components/textfield.dart';
import 'package:app_reconciliacion/Views/login.dart';
import 'package:app_reconciliacion/Views/mis_eventos.dart';
import 'package:flutter/material.dart';

//Registrarse
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final nombre = TextEditingController();
  final fNac = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  bool isNombreValid = true;
  bool isFNacValid = true;
  bool isEmailValid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/image/logo_reconciliacion.png',
                  width: 150,
                  height: 150,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text('Registrate',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 20),
                InputField(
                    hint: 'Nombre', icon: Icons.person, controller: nombre),
                InputField(
                    hint: 'Fecha de nacimiento',
                    icon: Icons.calendar_month,
                    controller: fNac),
                InputField(hint: 'Email', icon: Icons.email, controller: email),
                InputField(
                  hint: 'Contraseña',
                  icon: Icons.lock,
                  controller: password,
                  passwordInvisible: true,
                ),
                const SizedBox(height: 10),
                Button(
                  label: 'Continuar',
                  press: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MisEventos()));
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('¿Tienes una cuenta?',
                        style: TextStyle(fontSize: 18)),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        child: const Text('Iniciar Sesión',
                            style:
                                TextStyle(fontSize: 18, color: primaryColorM)))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _validateNombre(String value) {
    final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
    return nameExp.hasMatch(value);
  }

  bool _validateFNac(String value) {
    return true;
  }

  bool _validateEmail(String value) {
    final RegExp emailExp = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    return emailExp.hasMatch(value);
  }
}
