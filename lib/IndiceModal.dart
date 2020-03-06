import 'package:flutter/material.dart';

class IndiceModal extends StatelessWidget {

  Function() callback;
  String text;
  bool isUsefull;

  IndiceModal(this.callback, this.text, this.isUsefull);
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment(0.0, 0.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color.fromRGBO(0, 0, 0, 0.7),
        child: Container(
            padding: const EdgeInsets.only(top:30, bottom:20, right:20, left:20),
            color: Colors.white,
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(children: <Widget>[
              Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment(-1, -1),
                    child: Text(
                      'Vous avez trouvé un objet!',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ))),
              Expanded(
                  flex: 3,
                  child: Container(
                    alignment: Alignment(-1, 0.0),
                    child:Text(
                    this.text,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 30),
                  ))),
              Expanded(
                  flex: 1,
                  child:Container(
                    alignment: Alignment(1, 1),
                    child:  this.isUsefull ? RaisedButton(
                      onPressed: () {
                        callback();
                      },
                      color: Colors.blueGrey[700],
                      textColor: Colors.white,
                      child: Text(
                        'Suite',
                        style: TextStyle(fontSize: 30),
                      ),
                    ):RaisedButton(
                      onPressed: () {
                        callback();
                      },
                      color: Colors.red[300],
                      textColor: Colors.white,
                      child: Text(
                        'Retour',
                        style: TextStyle(fontSize: 30),
                      ),
                    )))
            ])));
  }

}
