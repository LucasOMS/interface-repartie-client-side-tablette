import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Connexion extends StatefulWidget {
  const Connexion({
    Key key,
  }) : super(key: key);
  _ConnexionState createState() => _ConnexionState();
}

// see the loader at https://flutterawesome.com/a-collection-of-loading-indicators-animated-with-flutter/
class _ConnexionState extends State<Connexion> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
          margin: new EdgeInsets.symmetric(horizontal: 50.0),
          child: Text(
            'Vous allez bientot devoir trouver un indice',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
          )),
      Container(
          margin: new EdgeInsets.symmetric(vertical: 50.0),
          child: SpinKitFadingFour(
            size: 200,
            color: Colors.yellow,
          )),

    ]);
  }
}
