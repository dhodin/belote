import 'package:belote/classes/mene.dart';

class Partie {
  // Information relative aux détails de la partie
  int identifiantPartie = 0;
  DateTime datePartie = DateTime.now();

  List<Mene> menes = [];
  bool partieEnNombreDePoints = false;
  bool partieEnNombreDeMenes = false;

  int _meneActive = -1;

  int valeurFinPartie = 0;

  // Identifiant des parties prenantes de la partie
  String nomJoueur1 = "Joueur 1";
  String nomJoueur2 = "Joueur 2";
  String nomJoueur3 = "Joueur 3";
  String nomJoueur4 = "Joueur 4";

  String nomEquipe1 = "Equipe1";
  String nomEquipe2 = "Equipe2";

  // Score en cours
  int pointsEquipe1 = 0;
  int pointsEquipe2 = 0;

  // Etat de la partie
  bool partieEnCours = true;

  /// Initialise une partie à partir de 0
  Partie(String nomJoueurPartie1, String nomJoueurPartie2,
      String nomJoueurPartie3, nomJoueurPartie4) {
    // Initialise le nom des joueurs et des équipes
    nomJoueur1 = nomJoueurPartie1;
    nomJoueur2 = nomJoueurPartie2;
    nomJoueur3 = nomJoueurPartie3;
    nomJoueur4 = nomJoueurPartie4;
    nomEquipe1 = nomJoueur1 + " / " + nomJoueur2;
    nomEquipe2 = nomJoueur3 + " / " + nomJoueur4;
  }

  /// Initialise une partie à partir d'un clone
  Partie.clone(Partie clonePartie)
      : nomJoueur1 = clonePartie.nomJoueur1,
        nomJoueur2 = clonePartie.nomJoueur2,
        nomJoueur3 = clonePartie.nomJoueur3,
        nomJoueur4 = clonePartie.nomJoueur4 {
    print("création du clone");
  }

  void ajouteMene() {}
}
