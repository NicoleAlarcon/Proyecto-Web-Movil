import 'package:app_reconciliacion/Components/button.dart';
import 'package:app_reconciliacion/Components/colors.dart';
import 'package:app_reconciliacion/Components/textfield.dart';
import 'package:app_reconciliacion/Views/login.dart';
import 'package:flutter/material.dart';

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
                Image.asset('assets/image/logo_reconciliacion.png'),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text('Regístrate', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                ),

                const SizedBox(height: 20),
                InputField(hint: 'Nombre', icon: Icons.person, controller: nombre),
                InputField(hint: 'Fecha de nacimiento', icon: Icons.calendar_month, controller: fNac),
                InputField(hint: 'Email', icon: Icons.email, controller: email),
                InputField(hint: 'Contraseña', icon: Icons.lock, controller: password),

                const SizedBox(height: 10),
                Button(label: 'Continuar', press: (){},),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('¿Tienes una cuenta?', style: TextStyle(fontSize: 18)),
                    TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));
                        },
                        child: const Text('Iniciar Sesión', style: TextStyle(fontSize: 18, color: primaryColorM)))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
