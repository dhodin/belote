import 'package:belote/classes/mene.dart';
import 'package:belote/classes/profil.dart';
import 'package:belote/variables/widgetCommuns.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class EcranPartie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CommunBottomAppBar(),
      appBar: AppBar(
        // TODO : Utiliser DataTable widget
        title: Text("Partie en cours"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Nouvelle mène'),
        icon: Icon(
          FontAwesomeIcons.plusSquare,
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/mene');
        },
      ),
      body: Column(
        children: [
          Card(
            child: ListTile(
              leading: Icon(FontAwesomeIcons.play),
              title: Text(
                  context.watch<Profil>().partieActive.menes.length.toString() +
                      " mene(s) jouée(s)"),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            child: Divider(
              color: Colors.black,
            ),
          ),          Card(
            child: ListTile(
              title: Text(
                context.watch<Profil>().partieActive.pointsEquipe1.toString(),
              ),
              subtitle: Text(
                context.watch<Profil>().partieActive.nomEquipe1.toString(),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(
                context.watch<Profil>().partieActive.pointsEquipe2.toString(),
              ),
              subtitle: Text(
                context.watch<Profil>().partieActive.nomEquipe2.toString(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            child: Divider(
              color: Colors.black,
            ),
          ),          // Menes
          Expanded(
            child: _ListeMenes(),
          ),
        ],
      ),
    );
  }
}

/// Liste les mènes jouées
class _ListeMenes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var profil = context.watch<Profil>();
    return ListView.builder(
      itemCount: profil.partieActive.menes.length,
      itemBuilder: (context, index) => _itemListeMenes(
        mene: profil.partieActive.menes[index],
        contextTransfert: context,
      ),
    );
  }
}

/// Affiche une partie
Widget _itemListeMenes(
    {required Mene mene, required BuildContext contextTransfert}) {
  return Card(
    child: ListTile(
      onTap: () {
/*         if (partie.partieEnCours) {
          Provider.of<Profil>(contextTransfert, listen: false)
              .changePartieActive(partie);
          Navigator.pushNamed(contextTransfert, '/partie');
        } else {
          Provider.of<Profil>(contextTransfert, listen: false)
              .supprimePartie(partie);
          
        } */
      },
      title: Text(mene.pointsEquipe1.toString() +
          " - " +
          mene.pointsEquipe2.toString()),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(partie.nomEquipe1 + " - " + partie.nomEquipe2),
          // Text(partie.pointsEquipe1.toString() +
          //     " - " +
          //     partie.pointsEquipe2.toString()),
        ],
      ),
      isThreeLine: true,
      dense: false,
      // trailing: partie.partieEnCours
      //     ? Icon(FontAwesomeIcons.folderOpen)
      //     : Icon(FontAwesomeIcons.trashAlt),
    ),
  );
}
