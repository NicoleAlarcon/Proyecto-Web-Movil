
import 'dart:convert';

Usuarios usuariosFromMap(String str) => Usuarios.fromMap(json.decode(str));

String usuariosToMap(Usuarios data) => json.encode(data.toMap());

class Usuarios {
  final int? usrId;
  final String? nombre;
  final String? fNac;
  final String? email;
  final String password;

  Usuarios({
    this.usrId,
    this.nombre,
    this.fNac,
    required this.email,
    required this.password,
  });

  //These json value must be same as your column name is database that we have already defined
  factory Usuarios.fromMap(Map<String, dynamic> json) => Usuarios(
    usrId: json["usrId"],
    nombre: json["nombre"],
    fNac: json["fNac"],
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toMap() => {
    "usrId": usrId,
    "nombre": nombre,
    "fNac": fNac,
    "email": email,
    "password": password,
  };
}
