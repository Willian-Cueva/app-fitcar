import 'package:flutter/material.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
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
        ),
        body: ListView(
          children: <Widget>[
            Center(
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 500,
                    child: Image.asset(
                      "assets/images/landing-mecanico.png",
                      fit: BoxFit.none,
                      scale: 8,
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: const Text(
                          "MANTÉN TU VEHÍCULO AL DÍA, CON FITCAR",
                          style: TextStyle(color: Colors.white70, fontSize: 30),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {}, child: const Text("Accede")),
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
