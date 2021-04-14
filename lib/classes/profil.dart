import 'package:belote/classes/partie.dart';
import 'package:belote/services/databaseLocal.dart';
import 'package:flutter/cupertino.dart';

class Profil with ChangeNotifier {
  // Services de sauvegarde des informations
  DatabaseSurDevice stockageLocal = DatabaseSurDevice();

  // Valeurs du profil
  String _nomProfil = "Nom joueur";
  bool _synchronisatioData = false;
  List<Partie> listeParties = [];
  Partie? _partieActive;

  Profil() {
    print("Démarrage de l'application");
    initializeProfil();
  }

  void initializeProfil() async {
    // Initialisation du stockage
    await stockageLocal.initializeDB();
    // TODO : Etape 1 = Chargement du profil
    listeParties = await stockageLocal.recupereParties();
    // TODO: Charge les parties du disque pour le MVP1
    print("Chargement des parties...");
    notifyListeners();
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
      String joueur1, String joueur2, String joueur3, String joueur4) async {
    Partie nouvellePartie = Partie(
      joueur1,
      joueur2,
      joueur3,
      joueur4,
    );
    // Enregistre la partie
    int result = await stockageLocal.insertPartie(nouvellePartie);
    nouvellePartie.id = result;
    _partieActive = nouvellePartie;
    listeParties.add(nouvellePartie);
    print("Identifiant de la partie " + result.toString());
    notifyListeners();
  }

  /// Supprime une partie de la liste
  void supprimePartie(Partie partieAsupprimer) async {
    await stockageLocal.deletePartie(partieAsupprimer.id!);
    listeParties.remove(partieAsupprimer);
    notifyListeners();
  }

  /// Actualise le numéro de la partie active
  void changePartieActive(Partie partieActive) =>
      _partieActive = partieActive;

  void ajouterMene() {
    _partieActive!.ajouteMene();
  }
}
