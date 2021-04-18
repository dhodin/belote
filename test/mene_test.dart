import 'package:belote/classes/mene.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Partie perdu par le preneur Equipe 1", () {
    Mene nouvelleMene = Mene(
      pointsEquipe1: 10,
      pointsEquipe2: 152,
      beloteEquipe1: 20,
      beloteEquipe2: 0,
      preneurEquipe1: true,
      preneurEquipe2: false,
      annonceEquipe1: 0,
      annonceEquipe2: 0,
      pointsBalotagePartiePrecedente: 0,
    );
    nouvelleMene.calculeScore();
    expect(nouvelleMene.pointsCalculEquipe1, equals(20));
    expect(nouvelleMene.pointsCalculEquipe2, equals(162));
  });

  test("Partie perdu par le preneur Equipe 2", () {
    Mene nouvelleMene = Mene(
      pointsEquipe1: 100,
      pointsEquipe2: 62,
      beloteEquipe1: 20,
      beloteEquipe2: 0,
      preneurEquipe1: false,
      preneurEquipe2: true,
      annonceEquipe1: 0,
      annonceEquipe2: 0,
      pointsBalotagePartiePrecedente: 0,
    );
    nouvelleMene.calculeScore();
    expect(nouvelleMene.pointsCalculEquipe1, equals(182));
    expect(nouvelleMene.pointsCalculEquipe2, equals(0));
  });

  test("Partie capot Equipe 1", () {
    Mene nouvelleMene = Mene(
      pointsEquipe1: 162,
      pointsEquipe2: 0,
      beloteEquipe1: 20,
      beloteEquipe2: 0,
      preneurEquipe1: true,
      preneurEquipe2: false,
      annonceEquipe1: 0,
      annonceEquipe2: 0,
      pointsBalotagePartiePrecedente: 0,
    );
    nouvelleMene.calculeScore();
    expect(nouvelleMene.pointsCalculEquipe1, equals(272));
    expect(nouvelleMene.pointsCalculEquipe2, equals(0));
  });


}
