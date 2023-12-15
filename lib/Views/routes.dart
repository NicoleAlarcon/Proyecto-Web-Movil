import 'package:app_reconciliacion/Views/exit.dart';
import 'package:app_reconciliacion/Views/notificaciones.dart';
import 'package:flutter/cupertino.dart';
import 'mis_eventos.dart';

class Routes extends StatelessWidget {
  final int index;
  const Routes({Key? key, required this.index }): super(key:key);

  @override
  Widget build(BuildContext context) {
    List<Widget> myList = [
      const MisEventos(),
      const Notificaciones(),
      const Exit(),
    ];
    return myList[index];
  }
}
