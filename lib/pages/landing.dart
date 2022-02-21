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
        body: Container(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Center(
                    child: Image.asset(
                      "assets/images/logo.png",
                      width: MediaQuery.of(context).size.width / 2,
                      height: 200,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
