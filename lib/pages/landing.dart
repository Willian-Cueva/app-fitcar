import 'package:fit_car/widgets/mi_appbar.dart';
import 'package:flutter/material.dart';

class Landing extends StatefulWidget {
  static Widget create(BuildContext context) => Landing();


  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: MiAppbar(),
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                child: Image.asset(
                  "assets/images/image12.png",
                  fit: BoxFit.none,
                  scale: 8,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 40),
                      child: const Text(
                        "MANTÉN TU VEHÍCULO AL DÍA, CON FITCAR",
                        style: TextStyle(color: Colors.white70, fontSize: 30),
                        textAlign: TextAlign.center,
                      )),
                  const Padding(padding: EdgeInsets.all(10)),
                  ElevatedButton(onPressed: () {}, child: const Text("Accede")),
                ],
              )
            ],
          ),
        ));
  }
}
