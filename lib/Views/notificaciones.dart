import 'package:app_reconciliacion/Views/login.dart';
import 'package:flutter/material.dart';
import 'mis_eventos.dart';

class Notificaciones extends StatefulWidget {
  const Notificaciones({Key? key});

  @override
  State<Notificaciones> createState() => _NotificacionesState();
}

class _NotificacionesState extends State<Notificaciones> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          'Notificaciones',
          style: TextStyle(color: Colors.white),
        ),
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
                _buildNotificationCard(),
              ],
            ),
          ),
        ),
      ),

      //Barra de navegación inferior
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
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MisEventos()));
            } else if (_currentIndex == 2) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LoginScreen()));
            }
          });
        },
      ),
    );
  }

  Widget _buildNotificationCard() {
    return const Card(
      margin: EdgeInsets.all(16.0),
      child: ListTile(
        title: Text('Faltan 2 días para el Culto de Navidad'),
      ),
    );
  }
}
