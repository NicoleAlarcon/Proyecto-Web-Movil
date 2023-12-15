import 'package:app_reconciliacion/Components/button.dart';
import 'package:app_reconciliacion/Components/colors.dart';
import 'package:app_reconciliacion/Components/textfield.dart';
import 'package:app_reconciliacion/JSON/usuarios.dart';
import 'package:app_reconciliacion/SQLite/database_helper.dart';
import 'package:app_reconciliacion/Views/mis_eventos.dart';
import 'package:app_reconciliacion/Views/registro.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  final password = TextEditingController();

  bool isChecked = false;
  bool isLoginTrue = false;
  final db = DataBaseHelper();

  //Login Method
  //We will take the value of text fields using controllers in order to verify whether details are correct or not
  login()async{
    var res = await db.autentificacion(Usuarios(email: email.text, password: password.text));
    if (res == true){
      //If result is correct then go to profile or home
      if (!mounted)return;
      Navigator.push(context as BuildContext, MaterialPageRoute(builder: (context)=>const MisEventos()));
    }else{
      //Otherwise show the error message
      setState(() {
        isLoginTrue = true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/image/logo_reconciliacion.png'),

                const SizedBox(height: 60),
                const Text('Iniciar Sesión', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),

                const SizedBox(height: 10),
                const Text('Email', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                InputField(
                    hint: 'example@gmail.com',
                    icon: Icons.account_circle,
                    controller: email,
                ),

                const SizedBox(height: 10),
                const Text('Contraseña', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                InputField(
                    hint: '********',
                    icon: Icons.lock,
                    controller: password,
                    passwordInvisible: true),

                const SizedBox(height: 10),
                //Our login button
                Button(
                    label: 'INGRESAR',
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MisEventos()));
                    }),

                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('¿No tienes una cuenta?', style: TextStyle(fontSize: 18)),
                    TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>  const SignupScreen()));
                        },
                        child: const Text('Registrate', style: TextStyle(color: primaryColorM, fontSize: 18),),)
                  ],
                ),

                //Acceso denegado
                isLoginTrue? Text('Correo o Contraseña incorrecta', style: TextStyle(color: Colors.red.shade900),): const SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
