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

  int pointsBalotage = 0;

  int annonceEquipe1 = 0;
  int annonceEquipe2 = 0;

  Mene({
    this.pointsEquipe1 = 0,
    this.pointsEquipe2 = 0,
    this.beloteEquipe1 = 0,
    this.beloteEquipe2 = 0,
    this.preneurEquipe1 = false,
    this.preneurEquipe2 = false,
    this.annonceEquipe1 = 0,
    this.annonceEquipe2 = 0,
  });

  void calculeScore(int balotage) {
    // Test capot
    if ((pointsEquipe1 == 162) || (pointsEquipe2 == 162)) {
      // Capot
      pointsCalculEquipe1 =
          (pointsEquipe1 == 162) ? (252 + beloteEquipe1) : beloteEquipe1;
      pointsCalculEquipe2 =
          (pointsEquipe2 == 162) ? (252 + beloteEquipe2) : beloteEquipe2;
    } else {
      // Pas de capot
      int pointsTotalEquipe1 = pointsEquipe1 + beloteEquipe1;
      int pointsTotalEquipe2 = pointsEquipe2 + beloteEquipe2;
      // Test du gagnant avec 1 si c'est l'équipe1, 2 si c'est l'équipe 2 et 0 si égalité
      int testGagnant = (pointsTotalEquipe1 > pointsTotalEquipe2)
          ? 1
          : ((pointsTotalEquipe1 < pointsTotalEquipe2) ? 2 : 0);

      // Calcul des points
      if (testGagnant == 0) {
        // Balotage
        pointsTotalEquipe1 =
            (preneurEquipe1 == true) ? beloteEquipe1 : (82 + beloteEquipe1);
        pointsTotalEquipe2 =
            (preneurEquipe2 == true) ? beloteEquipe2 : (82 + beloteEquipe2);
        pointsBalotage = 82;
      } else if (testGagnant == 1) {
        // Gagné par l'équipe1
        pointsCalculEquipe1 =
            (preneurEquipe1 == true) ? pointsCalculEquipe1 : beloteEquipe1;
        pointsCalculEquipe2 = (preneurEquipe1 == true)
            ? pointsCalculEquipe2
            : (162 + beloteEquipe2);
      } else {
        // Gagné par l'équipe 2
        pointsCalculEquipe2 =
            (preneurEquipe2 == true) ? pointsCalculEquipe2 : beloteEquipe2;
        pointsCalculEquipe1 = (preneurEquipe2 == true)
            ? pointsCalculEquipe1
            : (162 + beloteEquipe1);
      }
    }
  }
}
