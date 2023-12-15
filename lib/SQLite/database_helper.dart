
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../JSON/usuarios.dart';

class DataBaseHelper {
  final databaseName = 'auth.db';

  //Tablas
  String user = '''
  
  CREATE TABLE users (
  usrId  INTEGER PRIMARY KEY AUTOINCREMENT,
  fullName TEXT,
  email TEXT,
  usrName TEXT UNIQUE,
  usrPassword TEXT
  )
  ''';

  //Our connection is ready
  Future<Database> initDB()async{
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);

    return openDatabase(path, version: 1, onCreate: (db,version)async{
      await db.execute(user);

    });
  }

  //Funciton metods

  //Authentication
  Future<bool> autentificacion(Usuarios usr)async{
    final Database db = await initDB();
    var result = await db.rawQuery("select * from users where usrEmail = '${usr.email}' AND usrPassword = '${usr.password}' ");
    if(result.isNotEmpty){
      return true;
    }else{
      return false;
    }
  }

  //Sign up
  Future<int> crearUsuario(Usuarios usr)async{
    final Database db = await initDB();
    return db.insert('usuarios', usr.toMap());
  }

  //Get current  User details
  Future<Usuarios?> getUsuario(String usrName)async{
    final Database db = await initDB();
    var res = await db.query('users', where: 'usrName = ?', whereArgs: [usrName]);
    return res.isNotEmpty? Usuarios.fromMap(res.first): null;
  }
}