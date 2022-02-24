import 'package:fit_car/models/reqres.dart';
import 'package:fit_car/src/bloc/auth_cubit.dart';
import 'package:fit_car/widgets/mi_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

// const URL = "https://asistente-mecanico.herokuapp.com/api/vehiculos/";
const URL = "https://192.168.1.15:3000/api/vehiculos/";

Future<ReqResVehiculos> getVehiculos(var email) async {
  var uri = Uri.parse(URL + email);

  final resp = await http.get(uri);

  return reqResVehiculosFromJson(resp.body);
}

Future<ReqResTareas> getTareas(var email) async {
  var uri = Uri.parse(URL + email);

  final resp = await http.get(uri);

  return reqResTareasFromJson(resp.body);
}

class Home extends StatelessWidget {
  static Widget create(BuildContext context) => Home();

  var email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MiAppbar(),
      body: BlocBuilder<AuthCubit, AuthState>(
        buildWhen: (previous, current) => current is AuthSignedIn,
        builder: (_, state) {
          final authUser = (state as AuthSignedIn).user;
          email = authUser.email;
          return ListView(
            children: [
              FutureBuilder(
                future: getTareas(email),
                  builder: (BuildContext context, AsyncSnapshot<ReqResTareas> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return _ListaTareas(snapshot.data!.Tareas);
                }
              })
            ],
          );
        },
      ),
    );
  }
}

class _ListaTareas extends StatelessWidget {
  final List<Tarea> tareas;

  _ListaTareas(this.tareas);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: tareas.length,
        itemBuilder: (BuildContext context, int index) {
          final tarea = tareas[index];

          return ListTile(
            title: Text(tarea.titulo),
            subtitle: Text('Encargado: ${tarea.encargado}'),
            trailing: Icon(Icons.work_outline_rounded),
          );
        });
  }
}
