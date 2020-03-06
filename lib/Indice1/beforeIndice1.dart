import 'package:flutter/material.dart';

class BeforeIndice1 extends StatelessWidget {
  Function() next;
  BeforeIndice1(this.next);
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
            Container(
          margin: new EdgeInsets.symmetric(vertical: 25.0),
          child: Text(
            'Déplacez le téléphone pour trouver l\'indice !',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
          )),
      Container(
          margin: new EdgeInsets.symmetric(vertical: 25.0),
          child: Icon(
            Icons.open_with,
            color: Colors.yellow,
            size: 100.0,
          )),
      
      Container(
          margin: new EdgeInsets.symmetric(vertical: 50.0),
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
