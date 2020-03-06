import 'package:flutter/material.dart';
import '../IndiceModal.dart';
import './MovingClue1.dart';

class Indice1 extends StatefulWidget {
  Function() clueFoundEvent;
  Indice1(this.clueFoundEvent);
  _Indice1State createState() => _Indice1State();
}

class _Indice1State extends State<Indice1> {
  Widget currentModal;

  @override
  Widget build(BuildContext context) {
    return new Stack(children: <Widget>[
      MovingClue1(this.openModal),
      Positioned(
          width: MediaQuery.of(context).size.width,
          top: 100,
          left: 20,
          child: Container(
              margin: new EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Trouvez un indice \nen appuyant dessus.',
                overflow: TextOverflow.clip,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 30),
              ))),
      
          AnimatedOpacity(
              opacity: currentModal != null ? 1.0 : 0.0,
              duration: Duration(milliseconds: 500),
              child: this.currentModal
         )
    ]);
  }

  openModal(i) {
    print(i);

    setState(() => {
          if (i == 1)
            {
              this.currentModal = IndiceModal(
                  widget.clueFoundEvent,
                  'Vous venez de trouver un ballon. \nIl parait un peu trop léger...',
                  true)
            }
          else if (i == 2)
            {
              this.currentModal = IndiceModal(
                  this.closeModal,
                  'Ceci est juste un maillot sale. \nIl n\'a pas l\'air suspect.',
                  false)
            }
        });
  }

  closeModal() {
    setState(() => {this.currentModal = null});
  }
}
