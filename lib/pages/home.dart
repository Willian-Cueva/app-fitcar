import 'package:fit_car/models/reqres_model.dart';
import 'package:fit_car/src/bloc/auth_cubit.dart';
import 'package:fit_car/widgets/mi_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

Future<ReqResrespuesta> getUsuarios() async {
  final resp = await http.get(Uri.parse('https://reqres.in/api/users'));
  return reqResrespuestaFromJson(resp.body);
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
          return Center(
              child: ListView(
            children: <Widget>[
              Text('User: ${authUser.uid}'),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () => context.read<AuthCubit>().signOut(),
                  child: Text("Salir")),
              ElevatedButton(
                child: Icon(Icons.add_reaction_rounded),
                onPressed: () => print(email),
              ),
              FutureBuilder(
                builder: (BuildContext context,
                    AsyncSnapshot<ReqResrespuesta> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return _ListaUsuarios(snapshot.data!.data);
                  }
                },
                future: getUsuarios(),
              )
            ],
          ));
        },
      ),
    );
  }
}

class _ListaUsuarios extends StatelessWidget {
  final List<Usuario> usuarios;

  _ListaUsuarios(this.usuarios);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: usuarios.length,
        itemBuilder: (BuildContext context, int index) {
          final usuario = usuarios[index];
          return ListTile(
            title: Text('${usuario.firstName} ${usuario.lastName}'),
            subtitle: Text(usuario.email),
            trailing: Image.network(usuario.avatar),
          );
        });
  }
}
