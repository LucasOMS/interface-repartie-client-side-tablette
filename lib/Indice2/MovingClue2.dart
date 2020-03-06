import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';

typedef IntCallback = Function(int num);

class MovingClue2 extends StatefulWidget {
  IntCallback callback;
  MovingClue2(this.callback);
  _MovingClue2State createState() => _MovingClue2State();
}

class _MovingClue2State extends State<MovingClue2> {
  Stopwatch timer = new Stopwatch();
  double pX = 0;
  double pY = 0;
  double vX = 0;
  double vY = 0;

  @override
  Widget build(BuildContext context) {
    timer.start();
    double i = 0;
    double x = 0;
    double y = 0;
    gyroscopeEvents.listen((GyroscopeEvent event) {
      if (!mounted) return;

      if (event.x.abs() > 0.1 || event.y.abs() > 0.1) {
        i += 1;
        x += event.x;
        y += event.y;
        if (timer.elapsedMilliseconds > 50) {
          setCoordinates(x / i, y / i);
          timer.reset();
          i = 0;
          x = 0;
          y = 0;
        }
      }
    });
    double scale = 3;
    return new Container(
        alignment: Alignment(0, 0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Transform.translate(
          offset: Offset((MediaQuery.of(context).size.width*(1-scale)*pY)/2, (MediaQuery.of(context).size.height*(1-scale)*pX*0.1)),
          child: Transform.scale(
              scale: scale,
                      alignment: Alignment(0, 0),
              child: Stack(children: [
                Image.asset('assets/casiers.png'),
                Positioned(
                    top: 90,
                    left: 225,
                    child: GestureDetector(
                        onTap: () {
                          widget.callback(1);
                        },
                        child: new Container(
                          height: 25,
                          width: 50,
                          color: Colors.transparent,
                        ))),
                Positioned(
                    top: 25,
                    left: 25,
                    child: GestureDetector(
                        onTap: () {
                          widget.callback(3);
                        },
                        child: new Container(
                          height: 45,
                          width: 45,
                          color: Colors.transparent,
                        ))),
                Positioned(
                    top:135,
                    left: 285,
                    child: GestureDetector(
                        onTap: () {
                          widget.callback(2);
                        },
                        child: new Container(
                          height: 40,
                          width: 30,
                          color: Colors.transparent,
                        ))),
              ])),
        ));
  }

  void setCoordinates(accelerationX, accelerationY) {
    vX += accelerationX / 20;
    vY += accelerationY / 20;
    vX = vX * 0.98;
    vY = vY * 0.98;
    var posX = pX + vX / 2;
    var posY = pY + vY / 2;
    if (posX > 1) {
      posX = 1;
      vX = 0;
    }
    if (posX < -1) {
      posX = -1;
      vX = 0;
    }
    if (posY > 1) {
      posY = 1;
      vY = 0;
    }
    if (posY < -1) {
      posY = -1;
      vY = 0;
    }
    setState(() => {
          pX = posX,
          pY = posY,
        });
  }
}
