import 'package:fit_car/pages/home.dart';
import 'package:fit_car/pages/landing.dart';
import 'package:fit_car/pages/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const splash = "/";
  static const into = "/into";
  static const home = "/home";

  static Route routes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splash:
        return _buildRoute(SplashScreen.create);
      case into:
        return _buildRoute(Landing.create);
      case home:
        return _buildRoute(Home.create);
      default:
        throw Exception("Esa ruta no existe bro :(");
    }
  }

  static MaterialPageRoute _buildRoute(Function build) =>
      MaterialPageRoute(builder: (context) => build(context));
}
