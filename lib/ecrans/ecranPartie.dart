import 'package:belote/variables/widgetCommuns.dart';
import 'package:flutter/material.dart';

class EcranPartie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CommunBottomAppBar(),
      appBar: AppBar(
        // TODO : Utiliser DataTable widget
        title: Text("Partie en cours"),
      ),
    );
  }
}
