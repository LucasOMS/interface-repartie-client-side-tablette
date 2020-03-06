import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:front/router.dart';
import 'package:front/wait/connexion.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'package:flutter/services.dart';

Injector injector;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Material(
        type: MaterialType.transparency,
        child:FractionallySizedBox(
       widthFactor: 1,
        heightFactor: 1,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.grey[600], Colors.blueGrey[900]])
              ),
          child: Application(),
        )
      )
    ));
  }
}
