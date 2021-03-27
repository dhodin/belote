import 'package:belote/classes/partie.dart';
import 'package:flutter/cupertino.dart';

class Profil with ChangeNotifier {
  String _nomProfil = "Nom Joueur";
  bool _synchronisatioData = false;
  List<Partie> _listeParties = [];
  int _numPartieActive = 0;

  void initialiseProfil() {
    print("Initialisation du profil");
    changeNomProfil("David");
  }

  void changeNomProfil(String nouveauNom) => _nomProfil = nouveauNom;

  void ajoutePartie(
      {String? joueur1, String? joueur2, String? joueur3, String? joueur4}) {
    Partie nouvellePartie = Partie(
      nomJoueurPartie1: joueur1,
      nomJoueurPartie2: joueur2,
      nomJoueurPartie3: joueur3,
      nomJoueurPartie4: joueur4,
    );
    _listeParties.add(nouvellePartie);
    _numPartieActive = _listeParties.length - 1;
  }

  void supprimePartie(Partie supprimePartie) =>
      _listeParties.remove(supprimePartie);

  void changePartieActive(int indexPartieActive) =>
      _numPartieActive = indexPartieActive;

  void recupePartieActive() => _listeParties;
}
