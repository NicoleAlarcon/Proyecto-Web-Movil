import 'package:app_reconciliacion/Components/button_nav.dart';
import 'package:app_reconciliacion/Components/colors.dart';
import 'package:app_reconciliacion/Views/inscribir_eventos.dart';
import 'package:flutter/material.dart';

class MisEventos extends StatefulWidget {
  const MisEventos({super.key});

  @override
  State<MisEventos> createState() => _MisEventosState();
}

class _MisEventosState extends State<MisEventos> {
  int index = 0;
  BNavigator ?myBNB;

  @override
  void initState() {

    myBNB = BNavigator(currentIndex: (i){
      setState(() {
        index = i;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: myBNB,
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/image/logo_reconciliacion.png'),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text('Mis Eventos', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              ),
              const Text('Aún no tienes eventos', style: TextStyle(fontSize: 18)),
              TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>  const InscribirEventos()));
                },
                child: const Text('Inscribir Eventos', style: TextStyle(color: primaryColorM, fontSize: 18),),)
            ],
          ),),
        ),
      ),
    );
  }
}
