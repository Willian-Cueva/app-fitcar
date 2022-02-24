import 'dart:convert';

ReqResTareas reqResTareasFromJson(String str) => ReqResTareas.fromJson(json.decode(str));

String reqResTareasToJson(ReqResTareas data) => json.encode(data.toJson());

class ReqResTareas {
    ReqResTareas({
        required this.Tareas,
    });

    List<Tarea> Tareas;

    factory ReqResTareas.fromJson(Map<String, dynamic> json) => ReqResTareas(
        Tareas: List<Tarea>.from(json["tareas"].map((x) => Tarea.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "tareas": List<dynamic>.from(Tareas.map((x) => x.toJson())),
    };
}

class Tarea {
    Tarea({
        required this.id,
        required this.titulo,
        required this.descripcion,
        required this.pasos,
        required this.estado,
        required this.encargado,
        required this.encargadoNombre,
        required this.encargadoFoto,
        required this.emisor,
        required this.emisorFoto,
        required this.userId,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    String id;
    String titulo;
    String descripcion;
    String pasos;
    bool estado;
    String encargado;
    String encargadoNombre;
    String encargadoFoto;
    String emisor;
    String emisorFoto;
    String userId;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    factory Tarea.fromJson(Map<String, dynamic> json) => Tarea(
        id: json["_id"],
        titulo: json["titulo"],
        descripcion: json["descripcion"],
        pasos: json["pasos"],
        estado: json["estado"],
        encargado: json["encargado"],
        encargadoNombre: json["encargadoNombre"],
        encargadoFoto: json["encargadoFoto"],
        emisor: json["emisor"],
        emisorFoto: json["emisorFoto"],
        userId: json["userId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "titulo": titulo,
        "descripcion": descripcion,
        "pasos": pasos,
        "estado": estado,
        "encargado": encargado,
        "encargadoNombre": encargadoNombre,
        "encargadoFoto": encargadoFoto,
        "emisor": emisor,
        "emisorFoto": emisorFoto,
        "userId": userId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}


ReqResVehiculos reqResVehiculosFromJson(String str) => ReqResVehiculos.fromJson(json.decode(str));

String reqResVehiculosToJson(ReqResVehiculos data) => json.encode(data.toJson());

class ReqResVehiculos {
    ReqResVehiculos({
        required this.vehiculos,
    });

    List<Vehiculo> vehiculos;

    factory ReqResVehiculos.fromJson(Map<String, dynamic> json) => ReqResVehiculos(
        vehiculos: List<Vehiculo>.from(json["vehiculos"].map((x) => Vehiculo.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "vehiculos": List<dynamic>.from(vehiculos.map((x) => x.toJson())),
    };
}

class Vehiculo {
    Vehiculo({
        required this.id,
        required this.placa,
        required this.color,
        required this.estado,
        required this.activo,
        required this.marca,
        required this.userId,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
        required this.anio,
        required this.modelo,
    });

    String id;
    String placa;
    String color;
    String estado;
    bool activo;
    String marca;
    String userId;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    String anio;
    String modelo;

    factory Vehiculo.fromJson(Map<String, dynamic> json) => Vehiculo(
        id: json["_id"],
        placa: json["placa"],
        color: json["color"],
        estado: json["estado"],
        activo: json["activo"],
        marca: json["marca"],
        userId: json["userId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        anio: json["anio"],
        modelo: json["modelo"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "placa": placa,
        "color": color,
        "estado": estado,
        "activo": activo,
        "marca": marca,
        "userId": userId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "anio": anio,
        "modelo": modelo,
    };
}


ReqResUser reqResUserFromJson(String str) =>
    ReqResUser.fromJson(json.decode(str));

String reqResUserToJson(ReqResUser data) => json.encode(data.toJson());

class ReqResUser {
  ReqResUser({
    required this.user,
  });

  User user;

  factory ReqResUser.fromJson(Map<String, dynamic> json) => ReqResUser(
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
      };
}

class User {
  User({
    required this.id,
    required this.nombres,
    required this.apellidos,
    required this.porcentajeRegistro,
    required this.googleId,
    required this.activa,
    required this.foto,
    required this.correo,
    required this.codigo,
    required this.idVehiculos,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.rol,
  });

  String id;
  String nombres;
  String apellidos;
  int porcentajeRegistro;
  String googleId;
  bool activa;
  String foto;
  String correo;
  String codigo;
  List<dynamic> idVehiculos;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String rol;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        nombres: json["nombres"],
        apellidos: json["apellidos"],
        porcentajeRegistro: json["porcentajeRegistro"],
        googleId: json["googleId"],
        activa: json["activa"],
        foto: json["foto"],
        correo: json["correo"],
        codigo: json["codigo"],
        idVehiculos: List<dynamic>.from(json["idVehiculos"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        rol: json["rol"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "nombres": nombres,
        "apellidos": apellidos,
        "porcentajeRegistro": porcentajeRegistro,
        "googleId": googleId,
        "activa": activa,
        "foto": foto,
        "correo": correo,
        "codigo": codigo,
        "idVehiculos": List<dynamic>.from(idVehiculos.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "rol": rol,
      };
}
