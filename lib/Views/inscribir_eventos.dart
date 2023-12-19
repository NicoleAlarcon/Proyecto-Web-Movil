import 'package:app_reconciliacion/Views/login.dart';
import 'package:app_reconciliacion/Views/mis_eventos.dart';
import 'package:app_reconciliacion/Views/notificaciones.dart';
import 'package:flutter/material.dart';

class InscribirEventos extends StatefulWidget {
  const InscribirEventos({Key? key}) : super(key: key);

  @override
  _InscribirEventosState createState() => _InscribirEventosState();
}

class _InscribirEventosState extends State<InscribirEventos> {
  int _currentIndex = 0;

  bool inscritoInicia = false;
  bool inscritoUnidos = false;
  bool inscritoCasaOracion = false;
  bool inscritoCulto = false;
  bool inscritoPastoralG = false;
  bool inscritoCultoN = false;

  var appState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Inscribir Eventos', style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: ListView(
          children: [
            _buildCard(
              'Inicia',
              'Lunes de 19:45 a 21:45 p.m.',
              'Evento Presencial',
              inscritoInicia,
                  () {
                setState(() {
                  inscritoInicia = !inscritoInicia;
                });
              },
            ),

            _buildCard(
              'Unidos',
              'Martes y Jueves de 19:45 a 21:45 p.m.',
              'Evento Presencial',
              inscritoUnidos,
                  () {
                setState(() {
                  inscritoUnidos = !inscritoUnidos;
                });
              },
            ),

            _buildCard(
              'Casa de oración',
              'Miércoles de 07:00 a 09:00 a.m.',
              'Evento Presencial',
              inscritoCasaOracion,
                  () {
                setState(() {
                  inscritoCasaOracion = !inscritoCasaOracion;
                });
              },
            ),

            _buildCard(
              'Culto',
              'Miércoles y Domingo',
              'Evento Presencial y online',
              inscritoCulto,
                  () {
                setState(() {
                  inscritoCulto = !inscritoCulto;
                });
              },
            ),

            _buildCard(
              'Pastoral Generacional',
              'Sábado',
              'Evento Presencial',
              inscritoPastoralG,
                  () {
                setState(() {
                  inscritoPastoralG = !inscritoPastoralG;
                });
              },
            ),

            _buildCard(
              'Culto Navideño',
              'Viernes a las 19:45 p.m.',
              'Evento Presencial y Online',
              inscritoCultoN,
                  () {
                setState(() {
                  inscritoCultoN = !inscritoCultoN;
                });
              },
            ),
          ],
        ),
      ),


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

        //Navegación entre pantallas
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            // Navegar a la pantalla correspondiente cuando se selecciona un ítem del navbar
            if (_currentIndex == 0) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MisEventos()));
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



  Widget _buildCard(String title, String subtitle1, String subtitle2, bool inscrito, VoidCallback onPressed) {
    return Card(
      child: SizedBox(
        width: 390,
        height: 140,
        child: Column(
          children: [
            ListTile(
              title: Text(title),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(subtitle1),
                  Text(subtitle2),
                ],
              ),
              leading: const Icon(Icons.calendar_month_rounded),
            ),
            ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                primary: inscrito ? Colors.white.withOpacity(0.2) : Colors.purple,
              ),
                child: Text(inscrito ? 'Desinscribirme' : 'Inscribirme', style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
