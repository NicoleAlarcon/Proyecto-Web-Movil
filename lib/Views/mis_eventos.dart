import 'package:app_reconciliacion/Components/colors.dart';
import 'package:app_reconciliacion/Views/login.dart';
import 'package:flutter/material.dart';
import 'inscribir_eventos.dart';
import 'notificaciones.dart'; // Importa el archivo notificaciones.dart

class MisEventos extends StatefulWidget {
  const MisEventos({Key? key}) : super(key: key);

  @override
  State<MisEventos> createState() => _MisEventosState();
}

class _MisEventosState extends State<MisEventos> {
  int _currentIndex = 0;
  List<String> eventosInscritos = []; // Agrega esta lista para almacenar los eventos inscritos

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Mis Eventos', style: TextStyle(color: Colors.white)),
      ),
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
                if (eventosInscritos.isNotEmpty) // Mostrar solo si hay eventos inscritos
                  Column(
                    children: [
                      const Text('Eventos Inscritos:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      for (var evento in eventosInscritos)
                        Card(
                          child: ListTile(
                            title: Text(evento),
                            // Puedes agregar más detalles del evento si es necesario
                          ),
                        ),
                    ],
                  )
                else
                  const Text('Aún no tienes eventos', style: TextStyle(fontSize: 18)),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const InscribirEventos()));
                  },
                  child: const Text('Inscribir Eventos', style: TextStyle(color: primaryColorM, fontSize: 18)),
                ),
              ],
            ),
          ),
        ),
      ),

      // Barra de Navegación
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.purple,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.6),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notificaciones',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.exit_to_app),
            label: 'Salir',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            // Navegar a la pantalla correspondiente cuando se selecciona un ítem del navbar
            if (_currentIndex == 0) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MisEventos()));
            } else if (_currentIndex == 1) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Notificaciones()));
            } else if (_currentIndex == 2) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
            }
          });
        },
      ),
    );
  }
}
