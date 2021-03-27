import 'package:flutter/material.dart';

class EcranAccueil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.account_circle,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamed(context, "/profil");
          },
        ),
        title: Text("Mes parties"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/nouvelle_partie');
        },
      ),
      body: ListView(
        children: [
          itemListePartie(
            titre: "Partie en cours...",
            ouvrir: true,
            contextTransfert: context,
          ),
          itemListePartie(
            titre: "Partie terminée...",
            ouvrir: false,
            contextTransfert: context,
          ),
          itemListePartie(
            titre: "Partie terminée...",
            ouvrir: false,
            contextTransfert: context,
          ),
          itemListePartie(
            titre: "Partie terminée...",
            ouvrir: false,
            contextTransfert: context,
          ),
          itemListePartie(
            titre: "Partie terminée...",
            ouvrir: false,
            contextTransfert: context,
          ),
          itemListePartie(
            titre: "Partie terminée...",
            ouvrir: false,
            contextTransfert: context,
          ),
          itemListePartie(
            titre: "Partie terminée...",
            ouvrir: false,
            contextTransfert: context,
          ),
          itemListePartie(
            titre: "Partie terminée...",
            ouvrir: false,
            contextTransfert: context,
          ),
          itemListePartie(
            titre: "Partie terminée...",
            ouvrir: false,
            contextTransfert: context,
          ),
          itemListePartie(
            titre: "Partie terminée...",
            ouvrir: false,
            contextTransfert: context,
          ),
        ],
      ),
    );
  }

  Widget itemListePartie(
      {String titre = "...", bool ouvrir = true, contextTransfert}) {
    return Card(
      child: ListTile(
        onTap: () {
          ouvrir
              ? Navigator.pushNamed(contextTransfert, '/partie')
              : print("Supprimer la partie");
        },
        leading: ouvrir ? Icon(Icons.arrow_forward_ios) : null,
        title: Text(titre),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('David / Mickael - Laurent / Alaine'),
            Text('1082 - 36')
          ],
        ),
        isThreeLine: true,
        dense: false,
        trailing: ouvrir ? null : Icon(Icons.delete),
      ),
    );
  }
}
