import 'package:app_reconciliacion/Components/button.dart';
import 'package:app_reconciliacion/Components/cards.dart';
import 'package:app_reconciliacion/Components/elevated_card.dart';
import 'package:flutter/material.dart';

class InscribirEventos extends StatelessWidget {
  const InscribirEventos({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    ElevatedCardExample(),
                      CardExample(),
                      Text('Inicia', style: TextStyle(fontSize: 28)),
                      ListTile(
                        leading: Icon(Icons.calendar_month_outlined, size: 30),
                        title: Text('Lunes', style: TextStyle(fontSize: 28),),
                        subtitle: Text('De 19:45 a 21:30 p.m.', style: TextStyle(fontSize: 22), selectionColor: Colors.black,),
                      ),
                      ListTile(
                        leading: Icon(Icons.video_camera_back_outlined, size: 30),
                        subtitle: Text('Evento presencial', style: TextStyle(fontSize: 22),),
                      ),
                    Divider(),

                    Text('Unidos', style: TextStyle(fontSize: 28)),
                    ListTile(
                      leading: Icon(Icons.calendar_month_outlined, size: 30),
                      title: Text('Martes y Jueves', style: TextStyle(fontSize: 28),),
                      subtitle: Text('De 19:45 a 21:45 p.m.', style: TextStyle(fontSize: 22), selectionColor: Colors.black,),
                    ),
                    ListTile(
                      leading: Icon(Icons.video_camera_back_outlined, size: 30),
                      subtitle: Text('Evento presencial', style: TextStyle(fontSize: 22),),
                    ),


                    Divider(),

                    Text('Casa de oración', style: TextStyle(fontSize: 28)),
                    ListTile(
                      leading: Icon(Icons.calendar_month_outlined, size: 30),
                      title: Text('Martes y Jueves\n'
                          '\n De 7:00 a 9:00 a.m.', style: TextStyle(fontSize: 28),),
                      subtitle: Text('De 7:00 a 9:0 a.m.', style: TextStyle(fontSize: 22), selectionColor: Colors.black,),
                    ),
                    ListTile(
                      leading: Icon(Icons.video_camera_back_outlined, size: 30),
                      subtitle: Text('Evento presencial', style: TextStyle(fontSize: 22),),
                    ),
              ] ,
            ),
          ),
        ),
      ),
    );
  }
}
