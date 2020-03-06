import 'dart:async';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScanScreen extends StatefulWidget {
  Function() next;
  ScanScreen(this.next);
  @override
  _ScanState createState() => new _ScanState();
}

class _ScanState extends State<ScanScreen> {
  String barcode = "";

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text(
        'Scannez un maillot de football pour avoir plus d\'informations !',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
      ),
      Container(
          margin: new EdgeInsets.symmetric(vertical: 50.0),
          child: RaisedButton(
            onPressed: () {
              scan();
            },
            color: Colors.yellow,
            textColor: Colors.blueGrey[700],
            child: Text(
              'Scan',
              style: TextStyle(fontSize: 50),
            ),
          ))
    ]);}
  

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() => widget.next());
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          print(1);
          widget.next();
          this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        print(2);
        setState(() => this.barcode = 'Unknown error: $e');
        
      }
    } on FormatException{
      print(3);
      setState(() => this.barcode = 'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      print(4);
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }
}