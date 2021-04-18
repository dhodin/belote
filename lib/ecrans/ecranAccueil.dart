import 'package:belote/classes/partie.dart';
import 'package:belote/classes/profil.dart';
import 'package:belote/variables/widgetCommuns.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

/// Affichage de la page contenant la liste des parties
class EcranAccueil extends StatefulWidget {
  @override
  _EcranAccueilState createState() => _EcranAccueilState();
}

class _EcranAccueilState extends State<EcranAccueil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mes parties"),
      ),
      bottomNavigationBar: CommunBottomAppBar(),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Nouvelle partie'),
        icon: Icon(
          FontAwesomeIcons.plusSquare,
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/nouvelle_partie');
        },
      ),
      body: Column(
        children: [
          // Parties
          Expanded(
            child: _ListeParties(),
          ),
        ],
      ),
    );
  }
}

/// Liste les parties jouées
class _ListeParties extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var profil = context.watch<Profil>();
    return ListView.builder(
      itemCount: profil.listeParties.length,
      itemBuilder: (context, index) => _itemListePartie(
        partie: profil.listeParties[profil.listeParties.length - 1 - index],
        contextTransfert: context,
      ),
    );
  }
}

/// Affiche une partie
Widget _itemListePartie(
    {required Partie partie, required BuildContext contextTransfert}) {
  var afficheDate = partie.datePartie.day.toString() +
      "/" +
      partie.datePartie.month.toString() +
      "/" +
      partie.datePartie.year.toString() +
      " - " +
      partie.datePartie.hour.toString() +
      ":" +
      partie.datePartie.minute.toString();
  return Card(
    child: ListTile(
      onTap: () {
        if (partie.partieEnCours) {
          Provider.of<Profil>(contextTransfert, listen: false)
              .changePartieActive(partie);
          Navigator.pushNamed(contextTransfert, '/partie');
        } else {
          Provider.of<Profil>(contextTransfert, listen: false)
              .supprimePartie(partie);
          
        }
      },
      title: Text(afficheDate),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(partie.nomEquipe1 + " - " + partie.nomEquipe2),
          Text(partie.pointsEquipe1.toString() +
              " - " +
              partie.pointsEquipe2.toString()),
        ],
      ),
      isThreeLine: true,
      dense: false,
      trailing: partie.partieEnCours
          ? Icon(FontAwesomeIcons.folderOpen)
          : Icon(FontAwesomeIcons.trashAlt),
    ),
  );
}
