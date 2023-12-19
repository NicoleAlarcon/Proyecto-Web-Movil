import 'package:app_reconciliacion/Components/colors.dart';
import 'package:flutter/material.dart';

//Para mantener privada la contraseña al momento de escribirla

class InputField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final bool passwordInvisible;
  final TextEditingController controller;
  const InputField({super.key,
    required this.hint,
    required this.icon,
    required this.controller,
    this.passwordInvisible = false});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 6),
      width: size.width *.9,
      height: 55,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),

      child: Center(
        child: TextFormField(
          obscureText: passwordInvisible!,
          controller: controller,

          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
            icon: Icon(icon),
          ),
        ),
      ),
    );
  }
}
