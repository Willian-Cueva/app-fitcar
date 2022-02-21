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
        children: <Widget>[],
      ),
    );
  }
}
