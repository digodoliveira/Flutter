import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ListView(
        children: <Widget>[
          Container(
            width: 200.0,
            height: 200.0,
            child: FlareActor(
              'assets/WorldSpin.flr',
              animation: 'roll',
            ),
          ),
          /*
          Container(
            width: 200.0,
            height: 200.0,
            child: FlareActor(
              'assets/WorldSpin.flr',
              animation: 'roll',
            ),
          ),
          */
        ],
      )),
    );
  }
}
