import 'package:belote/classes/mene.dart';

class Partie {
  // Information relative aux détails de la partie
  int identifiantPartie = 0;

  List<Mene> menes = [];
  bool partieEnNombreDePoints = false;
  bool partieEnNombreDeMenes = false;

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

  Partie(
      {nomJoueurPartie1 = "joueur 1",
      nomJoueurPartie2 = "joueur 2",
      nomJoueurPartie3 = "joueur 3",
      nomJoueurPartie4 = "joueur 4"}) {
    nomJoueur1 = nomJoueurPartie1;
    nomJoueur2 = nomJoueurPartie2;
    nomJoueur3 = nomJoueurPartie3;
    nomJoueur4 = nomJoueurPartie4;
  }

  void ajouteMene() {}
}
