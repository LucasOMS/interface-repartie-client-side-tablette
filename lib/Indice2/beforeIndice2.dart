import 'package:flutter/material.dart';

class BeforeIndice2 extends StatelessWidget {
  Function() next;
  BeforeIndice2(this.next);
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
          margin: new EdgeInsets.symmetric(vertical: 25.0),
          child: Text(
            'Tournez le téléphone pour trouver l\'indice !',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
          )),
      Container(
          margin: new EdgeInsets.symmetric(vertical: 25.0),
          child: Icon(
            Icons.threed_rotation,
            color: Colors.yellow,
            size: 100.0,
          )),
      Container(
          margin: new EdgeInsets.symmetric(vertical: 25.0),
          child: RaisedButton(
            onPressed: () {
              next();
            },
            color: Colors.yellow,
            textColor: Colors.blueGrey[700],
            child: Text(
              'J\'ai compris !',
              style: TextStyle(fontSize: 30),
            ),
          ))
    ]);
  }
}
