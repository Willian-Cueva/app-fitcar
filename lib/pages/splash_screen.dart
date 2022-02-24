import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static Widget create(BuildContext context) => const SplashScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/images/logo.png",
              height: 150,
            ),
            CircularProgressIndicator(),
            SizedBox(
              height: 24,
            ),
            // Text(
            //   "Iniciando :D ...",
            //   style: TextStyle(fontSize: 24, color: Colors.white),
            // )
          ],
        ),
      ),
    );
  }
}
