import 'package:front/wait/connexion.dart';
import 'package:front/scan.dart';
import 'package:flutter/material.dart';
import 'package:front/Indice1/postIndice1.dart';
import 'package:front/Indice1/indice1.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:front/wait/finish.dart';
import 'package:front/Indice2/indice2.dart';
import 'package:front/Indice2/postIndice2.dart';
import 'package:front/Indice1/beforeIndice1.dart';
import 'package:front/Indice2/beforeIndice2.dart';
import 'package:front/PostScan.dart';





class Application extends StatefulWidget {
  const Application();
  
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  SocketService socket = new SocketService();
  Widget currentRoute;

  @override
  Widget build(BuildContext context) {
    if(currentRoute==null){
      this.currentRoute=Connexion();
    }
    socket.connect().on(
        "EXPLORE_PLACE",
        (data) => {
              if (data.toString() == '{id: 2}')
                {
                  setState(() {
                    currentRoute = BeforeIndice1(this.beforeClue1);

                  })
                }
            });
    return new Container(
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          currentRoute,
        ]));
  }

  begin() {
    setState(() {
      currentRoute = BeforeIndice1(this.beforeClue1);
    });
  }

  beforeClue1() {
    setState(() {
      currentRoute = Indice1(this.clue1Found);
    });
  }

  clue1Found() {
    socket.clue2();
    setState(() {
      currentRoute = PostIndice1(this.postIndice1);
    });
  }
  postIndice1() {
    setState(() {
      currentRoute = BeforeIndice2(this.beforeIndice2);
    });
  }
  beforeIndice2() {
    setState(() {
      currentRoute = Indice2(this.clue2Found);
    });
  }

  clue2Found() {
    setState(() {
      currentRoute = PostIndice2(this.postIndice2);
    });
  }

  postIndice2() {
    socket.clue3();
    setState(() {
      currentRoute = ScanScreen(this.afterScan);
    });
  }
  afterScan() {
    setState(() {
      currentRoute = PostScan(this.end);
    });
  }

  end() {
    setState(() {
      currentRoute = Finish();
    });
  }
}

class SocketService {
  IO.Socket socket;
  connect() {
    socket = IO.io('http://192.168.1.4:10000/', <String, dynamic>{
      'transports': ['websocket'],
    });
    socket.on("connect", (_) => print("Connected"));
    socket.emit('REGISTER_DEVICE', {"device_type": "TABLET"});
    return socket;
  }
  clue2(){
    socket.connect().emit('CLUE_FOUND', {"clue_id": "2"});
  }
  clue3(){
    socket.connect().emit('CLUE_FOUND', {"clue_id": "3"});
  }
}
