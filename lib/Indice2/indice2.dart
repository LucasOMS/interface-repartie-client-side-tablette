import 'package:flutter/material.dart';
import '../IndiceModal.dart';
import './MovingClue2.dart';

class Indice2 extends StatefulWidget {
  Function() clueFoundEvent;
  Indice2(this.clueFoundEvent);
  _Indice2State createState() => _Indice2State();
}

class _Indice2State extends State<Indice2> {
  Widget currentModal;

  @override
  Widget build(BuildContext context) {
    return new Stack(children: <Widget>[
      MovingClue2(this.openModal),
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
          child: this.currentModal)
    ]);
  }

  openModal(i) {
    print(i);

    setState(() => {
          if (i == 1)
            {
              this.currentModal = 
                IndiceModal(widget.clueFoundEvent,
                'Ces chaussures ne sont pas aux normes... Nous allons les inspecter.', true)
            }
          else if (i == 2)
            {
              this.currentModal =
                IndiceModal(this.closeModal, 
                'Le fils du coach, Rien d\'interessant ici', false)
            }
          else if (i == 3)
            {
              this.currentModal =
                IndiceModal(this.closeModal, 
                'Rien de caché derrière cette horloge...', false)
            }
        });
  }

  closeModal() {
    setState(() => {this.currentModal = null});
  }
}
