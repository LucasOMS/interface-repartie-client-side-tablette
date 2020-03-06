import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';

typedef IntCallback = Function(int num);

class MovingClue1 extends StatefulWidget {
  final IntCallback callback;
  MovingClue1(this.callback);
  _MovingClue1State createState() => _MovingClue1State();
}

class _MovingClue1State extends State<MovingClue1> {
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
    userAccelerometerEvents.listen((UserAccelerometerEvent event) {
      if (!mounted) return;
      if (event.x.abs() > 0.5 || event.y.abs() > 0.5) {
        i += 1;
        x += event.x;
        y += event.y;
        if (timer.elapsedMilliseconds > 100) {
          setCoordinates(x / i, y / i);
          timer.reset();
          i = 0;
          x = 0;
          y = 0;
        }
      }
    });
    double scale = 4;
    return new Container(
        alignment: Alignment(0, 0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Transform.translate(
          offset: Offset((MediaQuery.of(context).size.width*(1-scale)*pX)/2, (-MediaQuery.of(context).size.height*(1-scale)*pY*0.6)),
          child: Transform.scale(
              scale: scale,
              child: Stack(children: [
                Image.asset('assets/vestiaires.png',
                    width: MediaQuery.of(context).size.width),
                Positioned(
                    top: 200,
                    left: 80,
                    child: GestureDetector(
                        onTap: () {
                          widget.callback(2);
                        },
                        child: new Container(
                          height: 40,
                          width: 40,
                          color: Colors.transparent,
                        ))),
                Positioned(
                    top: 330,
                    left: 60,
                    child: GestureDetector(
                        onTap: () {
                          widget.callback(1);
                        },
                        child: new Container(
                          height: 50,
                          width: 50,
                          color: Colors.transparent,
                        ))),
              ])),
        ));
  }

  void setCoordinates(accelerationX, accelerationY) {
    vX += accelerationX / 10;
    vY += accelerationY / 10;
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
    if (posY > 0.5) {
      posY = 0.5;
      vY = 0;
    }
    if (posY < -0.5) {
      posY = -0.5;
      vY = 0;
    }
    setState(() => {
          pX = posX,
          pY = posY,
        });
  }
}
