import 'package:app_reconciliacion/Components/colors.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String label;
  final VoidCallback press;
  const Button({super.key, required this.label, required this.press});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      width: size.width *.9,
      height: 55,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [primaryColorM, primaryColorA],
        ),
        borderRadius: BorderRadius.circular(10)
      ) ,
      child: TextButton(
        onPressed: press,
        child: Text(label, style: const TextStyle(color: Colors.white),),
      ),
    );
  }
}