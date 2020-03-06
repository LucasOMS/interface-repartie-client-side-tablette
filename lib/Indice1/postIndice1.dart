import 'package:flutter/material.dart';

class PostIndice1 extends StatelessWidget {
  Function() next;
  PostIndice1(this.next);
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text(
        'Le ballon a été transféré à la table !',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
      ),
      Container(
          margin: new EdgeInsets.symmetric(vertical: 50.0),
          child: RaisedButton(
            onPressed: () {
              next();
            },
            color: Colors.yellow,
            textColor: Colors.blueGrey[700],
            child: Text(
              'Suite',
              style: TextStyle(fontSize: 50),
            ),
          ))
    ]);
  }
}
