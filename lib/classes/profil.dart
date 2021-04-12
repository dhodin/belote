import 'package:belote/classes/partie.dart';
import 'package:flutter/cupertino.dart';

class Profil with ChangeNotifier {
  String _nomProfil = "Nom joueur";
  bool _synchronisatioData = false;
  List<Partie> listeParties = [];
  int _numPartieActive = -1;

  Profil() {
    print("Démarrage de l'application");
    chargeParties();
  }

  void chargeParties() {
    // TODO: Charge les parties du disque pour le MVP1
    print("Chargement des parties...");
  }

  /// Met à jour le nom du joueur
  void changeNomProfil(String nouveauNom) => _nomProfil = nouveauNom;

  /// Gestion à partir de la liste des parties
  /// Création à partir d'une partie existante
  void clonePartie(int numeroAcloner) {
    listeParties.add(Partie.clone(listeParties[numeroAcloner]));
  }

  /// Gestion à partir de la liste des parties
  /// Création à partir de 0
  void ajoutePartie(
      String joueur1, String joueur2, String joueur3, String joueur4) {
    listeParties.add(Partie(
      joueur1,
      joueur2,
      joueur3,
      joueur4,
    ));
    _numPartieActive = listeParties.length - 1;
    notifyListeners();
  }

  /// Supprime une partie de la liste
  void supprimePartie(int positionPartie) {
    listeParties.remove(listeParties[positionPartie]);
    if (_numPartieActive == positionPartie) {
      _numPartieActive = -1;
    }
  }

  /// Actualise le numéro de la partie active
  void changePartieActive(int indexPartieActive) =>
      _numPartieActive = indexPartieActive;

  void ajouterMene() {
    listeParties[_numPartieActive].ajouteMene();
  }
}
