import 'package:belote/classes/partie.dart';
import 'package:belote/classes/profil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum ChoixBelotte { equipe1, equipe2, aucune }
enum ChoixPreneur { equipe1, equipe2 }

class EcranMene extends StatefulWidget {
  @override
  _EcranMeneState createState() => _EcranMeneState();
}

class _EcranMeneState extends State<EcranMene> {
  int valeurScore1 = 81;
  int valeurScore2 = 81;
  // valeurs par défaut des zone de choix
  ChoixBelotte? _belotte = ChoixBelotte.aucune;
  ChoixPreneur? _preneur = ChoixPreneur.equipe1;

  @override
  Widget build(BuildContext context) {
    Partie partieActuelle =
        Provider.of<Profil>(context, listen: false).partieActive;
    return Scaffold(
      // Ajout de la barre de traitement des informations
      appBar: AppBar(
        title: Text("Nouvelle mène"),
        backgroundColor: Colors.blueGrey,
      ),
      // Ajout du corp de la fonction
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Preneur",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            ListTile(
              title: Text('${partieActuelle.nomEquipe1}'),
              leading: Radio<ChoixPreneur>(
                value: ChoixPreneur.equipe1,
                groupValue: _preneur,
                onChanged: (ChoixPreneur? value) {
                  setState(() {
                    _preneur = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('${partieActuelle.nomEquipe2}'),
              leading: Radio<ChoixPreneur>(
                value: ChoixPreneur.equipe2,
                groupValue: _preneur,
                onChanged: (ChoixPreneur? value) {
                  setState(() {
                    _preneur = value;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              child: Divider(
                color: Colors.black,
              ),
            ),
            Text(
              valeurScore1.toString() + " - " + partieActuelle.nomEquipe1,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Slider(
              label: "Score Equipe1",
              divisions: 162,
              min: 0,
              max: 162,
              onChanged: (double nouvelleValeur) {
                setState(() {
                  valeurScore1 = nouvelleValeur.round();
                  valeurScore2 = 162 - nouvelleValeur.round();
                });
              },
              value: valeurScore1.toDouble(),
            ),
            Text(
              valeurScore2.toString() + " - " + partieActuelle.nomEquipe2,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Slider(
              label: "Score Equipe2",
              divisions: 162,
              min: 0.0,
              max: 162.0,
              onChanged: (double nouvelleValeur) {
                setState(() {
                  valeurScore2 = nouvelleValeur.round();
                  valeurScore1 = 162 - nouvelleValeur.round();
                });
              },
              value: valeurScore2.toDouble(),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              child: Divider(
                color: Colors.black,
              ),
            ),
            ListTile(
              title: Text('Belotte pour ${partieActuelle.nomEquipe1}'),
              leading: Radio<ChoixBelotte>(
                value: ChoixBelotte.equipe1,
                groupValue: _belotte,
                onChanged: (ChoixBelotte? value) {
                  setState(() {
                    _belotte = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('Belotte pour ${partieActuelle.nomEquipe2}'),
              leading: Radio<ChoixBelotte>(
                value: ChoixBelotte.equipe2,
                groupValue: _belotte,
                onChanged: (ChoixBelotte? value) {
                  setState(() {
                    _belotte = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('Pas de Belotte'),
              leading: Radio(
                value: ChoixBelotte.aucune,
                groupValue: _belotte,
                onChanged: (ChoixBelotte? value) {
                  setState(() {
                    _belotte = value;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              child: Divider(
                color: Colors.black,
              ),
            ),
            TextButton(
              onPressed: () {
                int beloteEq1 = 0;
                int beloteEq2 = 0;
                bool preneurEq1 = false;
                bool preneurEq2 = false;
                // Défini qui est le preneur
                if (_preneur == ChoixPreneur.equipe1) {
                  preneurEq1 = true;
                } else {
                  preneurEq2 = true;
                }
                // Calcule le score de belote
                if (_belotte == ChoixBelotte.equipe1) beloteEq1 = 20;
                if (_belotte == ChoixBelotte.equipe2) beloteEq2 = 20;
                // Modifie le score et retourne à la page de la partie en cours
                Provider.of<Profil>(context, listen: false).ajouterMene(
                    valeurScore1, valeurScore2, beloteEq1, beloteEq2, preneurEq1, preneurEq2);
                Navigator.pop(context);
              },
              child: Text(
                "Enregistrer",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),

      // Ajout de la barre de naviguation
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.blueGrey,
        child: Container(
          height: 50.0,
        ),
      ),
    );
  }
}
