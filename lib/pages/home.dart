import 'package:fit_car/src/bloc/auth_cubit.dart';
import 'package:fit_car/widgets/mi_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

Future<int> getStatusCode() async {
  var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
  http.Response response = await http.get(url);
  return response.statusCode;
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
              child: Column(
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
            ],
          ));
        },
      ),
    );
  }
}
