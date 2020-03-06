import 'package:flutter/material.dart';

class Finish extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text(
        'Vous avez trouvé les deux indices !',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
      ),
      
    ]);
  }
}
