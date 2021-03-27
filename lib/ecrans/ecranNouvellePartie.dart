import 'package:flutter/material.dart';

class EcranNouvellePartie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nouvelle partie"),
      ),
      body: Container(
        child: IconButton(
          icon: Icon(Icons.queue_play_next),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, '/partie', ModalRoute.withName('/accueil'));
          },
        ),
      ),
    );
  }
}
