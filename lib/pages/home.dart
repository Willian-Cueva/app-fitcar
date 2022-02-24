import 'package:fit_car/models/reqres.dart';
import 'package:fit_car/src/bloc/auth_cubit.dart';
import 'package:fit_car/widgets/mi_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

// const URL = "https://asistente-mecanico.herokuapp.com/api/vehiculos/";
const URLVEHICULOS = "https://asistente-mecanico.herokuapp.com/api/vehiculos/";
const URLTAREAS = "https://asistente-mecanico.herokuapp.com/api/tareas/";

Future<ReqResVehiculos> getVehiculos(var email) async {
  var uri = Uri.parse(URLVEHICULOS + email);
  final resp = await http.get(uri);

  return reqResVehiculosFromJson(resp.body);
}

Future<ReqResTareas> getTareas(var email) async {
  var uri = Uri.parse(URLTAREAS + email);

  final resp = await http.get(uri);

  return reqResTareasFromJson(resp.body);
}

class Home extends StatelessWidget {
  static Widget create(BuildContext context) => Home();

  var email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: Image.asset(
          "assets/images/logo.png",
          width: 100,
        ),
        actions: [
          IconButton(
              onPressed: () {
                AlertDialog alerta = AlertDialog(
                  content: Text("¿Desea Salir?"),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () => context.read<AuthCubit>().signOut(),
                        child: Text("Ok"))
                  ],
                );
                showDialog(
                    context: context,
                    builder: (BuildContext context) => alerta);
              },
              icon: Icon(Icons.exit_to_app_outlined))
        ],
      ),
      body: BlocBuilder<AuthCubit, AuthState>(
        buildWhen: (previous, current) => current is AuthSignedIn,
        builder: (_, state) {
          final authUser = (state as AuthSignedIn).user;
          email = authUser.email;
          return ListView(
            primary: false,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10, left: 10),
                child: Text(
                  "Lista de tareas",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              Divider(
                color: Colors.grey[350],
              ),
              FutureBuilder(
                  future: getTareas(email),
                  builder: (BuildContext context,
                      AsyncSnapshot<ReqResTareas> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return _ListaTareas(snapshot.data!.todas);
                    }
                  }),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 10),
                child: Text("Lista de Vehiculos",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
              Divider(
                color: Colors.grey[350],
              ),
              FutureBuilder(
                  future: getVehiculos(email),
                  builder: (BuildContext context,
                      AsyncSnapshot<ReqResVehiculos> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return _ListaVehiculos(snapshot.data!.vehiculos);
                    }
                  })
            ],
          );
        },
      ),
    );
  }
}

class _ListaVehiculos extends StatelessWidget {
  final List<Vehiculo> vehiculos;

  _ListaVehiculos(this.vehiculos);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        scrollDirection: Axis.vertical,
        primary: false,
        shrinkWrap: true,
        itemCount: vehiculos.length,
        itemBuilder: (BuildContext context, int index) {
          final vehiculo = vehiculos[index];

          return Card(
              child: ListTile(
                  leading: Icon(
                    Icons.car_repair,
                    size: 50,
                  ),
                  title: Text(vehiculo.placa),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Text>[
                      Text(
                        'Marca: ${vehiculo.marca}',
                      ),
                      Text('Modelo: ${vehiculo.modelo}')
                    ],
                  ),
                  trailing: Icon(Icons.more_vert),
                  isThreeLine: true));
        });
  }
}

class _ListaTareas extends StatelessWidget {
  final List<Toda> tareas;

  _ListaTareas(this.tareas);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        primary: false,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: tareas.length,
        itemBuilder: (BuildContext context, int index) {
          final tarea = tareas[index];

          return Card(
              child: ListTile(
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                            image: NetworkImage(tarea.encargadoFoto),
                            fit: BoxFit.cover)),
                  ),
                  title: Text(tarea.titulo),
                  subtitle: Text(tarea.descripcion),
                  trailing: Icon(Icons.more_vert),
                  isThreeLine: true));
        });
    // TODO: implement build
  }
}
