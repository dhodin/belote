class Mene {
  int identifiantPartie = 0;
  int nuleroMene = 0;

  int pointsEquipe1 = 0;
  int pointsEquipe2 = 0;

  int beloteEquipe1 = 0;
  int beloteEquipe2 = 0;

  bool preneurEquipe1 = false;
  bool preneurEquipe2 = false;

  int pointsCalculEquipe1 = 0;
  int pointsCalculEquipe2 = 0;

  Mene({
    this.pointsEquipe1 = 0,
    this.pointsEquipe2 = 0,
    this.beloteEquipe1 = 0,
    this.beloteEquipe2 = 0,
    this.preneurEquipe1 = false,
    this.preneurEquipe2 = false,
  });

  void calculeScore(int balotage) {
    int pointsTotalEquipe1 = pointsEquipe1 + beloteEquipe1;
    int pointsTotalEquipe2 = pointsEquipe2 + beloteEquipe2;

    // Test du gagnant avec 1 si c'est l'équipe1, 2 si c'est l'équipe 2 et 0 si égalité
    int testGagnant = (pointsTotalEquipe1 > pointsTotalEquipe2)
        ? 1
        : ((pointsTotalEquipe1 < pointsTotalEquipe2) ? 2 : 0);

    // Calcul des points
    if (preneurEquipe1 == true) {
      if (testGagnant == 1) {
      } else if (testGagnant == 2) {
      } else {}
    } else {
      if (testGagnant == 2) {
      } else if (testGagnant == 1) {
      } else {}
    }
  }
}
