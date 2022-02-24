import 'package:fit_car/src/bloc/auth_cubit.dart';
import 'package:fit_car/src/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final _navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  static Widget create() {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSignedOut) {
          _navigatorKey.currentState
              ?.pushNamedAndRemoveUntil(Routes.into, (r) => false);
        } else if (state is AuthSignedIn) {
          _navigatorKey.currentState
              ?.pushNamedAndRemoveUntil(Routes.home, (r) => false);
        }
      },
      child: MyApp(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      title: 'Fit Car',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      onGenerateRoute: Routes.routes,
      // home: Home(),
    );
  }
}
