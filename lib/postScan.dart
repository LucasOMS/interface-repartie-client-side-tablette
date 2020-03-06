import 'package:flutter/material.dart';

class PostScan extends StatelessWidget {
  Function() next;
  PostScan(this.next);
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text(
        'Vous venez de scanner un maillot de football !!',
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
              'Fin',
              style: TextStyle(fontSize: 50),
            ),
          ))
    ]);
  }
}
