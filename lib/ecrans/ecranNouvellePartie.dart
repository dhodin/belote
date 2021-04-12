import 'package:belote/classes/profil.dart';
import 'package:belote/variables/widgetCommuns.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class EcranNouvellePartie extends StatefulWidget {
  @override
  _EcranNouvellePartieState createState() => _EcranNouvellePartieState();
}

class _EcranNouvellePartieState extends State<EcranNouvellePartie> {
// Nom des joueurs
  String _joueur1 = "Joueur 1";
  String _joueur2 = "Joueur 2";
  String _joueur3 = "Joueur 3";
  String _joueur4 = "Joueur 4";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Nouvelle partie"),
        ),
        bottomNavigationBar: CommunBottomAppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Column(
                children: [
                  const ListTile(
                    leading: Icon(FontAwesomeIcons.users),
                    title: Text('Equipe 1'),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Joueur 1',
                      ),
                      onChanged: (value) {
                        value == "" ? _joueur1 = "Joueur 1" : _joueur1 = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Joueur 2',
                      ),
                      onChanged: (value) {
                        value == "" ? _joueur2 = "Joueur 2" : _joueur2 = value;
                      },
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.grey,
              height: 20.0,
              indent: 20.0,
              endIndent: 20.0,
            ),
            Card(
              child: Column(
                children: [
                  const ListTile(
                    leading: Icon(FontAwesomeIcons.users),
                    title: Text('Equipe 2'),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Joueur 3',
                      ),
                      onChanged: (value) {
                        value == "" ? _joueur3 = "Joueur 3" : _joueur3 = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Joueur 4',
                      ),
                      onChanged: (value) {
                        value == "" ? _joueur4 = "Joueur 4" : _joueur4 = value;
                      },
                    ),
                  )
                ],
              ),
            ),
            const Divider(
              color: Colors.grey,
              height: 20.0,
              indent: 20.0,
              endIndent: 20.0,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
              child: ElevatedButton(
                onPressed: () {
                  print("créer");
                  Provider.of<Profil>(context, listen: false).ajoutePartie(_joueur1, _joueur2, _joueur3, _joueur4);
                  Navigator.pop(context);
                  /* Navigator.pushNamedAndRemoveUntil(
                      context, '/partie', ModalRoute.withName('/accueil')); */
                },
                child: Text("Démarrer..."),
              ),
            ),
          ],
        ));
  }
}
