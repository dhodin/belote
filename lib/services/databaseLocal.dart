import 'package:belote/classes/partie.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseSurDevice {
  /// Initialisation de la base de données
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'parties.db'),
      onCreate: (database, version) async {
        /*      await database.execute(
          "CREATE TABLE profil(id INTEGER PRIMARY KEY AUTOINCREMENT, nomProfil TEXT NOT NULL)",
        ); */
        await database.execute(
          "CREATE TABLE parties(id INTEGER PRIMARY KEY AUTOINCREMENT, nomJoueur1 TEXT NOT NULL, nomJoueur2 TEXT NOT NULL, nomJoueur3 TEXT NOT NULL, nomJoueur4 TEXT NOT NULL, nomEquipe1 TEXT NOT NULL, nomEquipe2 TEXT NOT NULL, pointsEquipe1 INTEGER NOT NULL, pointsEquipe2 INTEGER NOT NULL)",
        );
      },
      version: 1,
    );
  }

  /// Sauvegarde une nouvelle partie
  Future<int> insertPartie(Partie partie) async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db.insert(
      'parties',
      partie.toMap(),
    );
    return result;
  }

  /// Met à jour une partie existante
  Future<int> updatePartie(Partie partie) async {
    int result = 0;
    final Database db = await initializeDB();
    result = await db.update(
      'parties',
      partie.toMap(),
      where: 'id = ?',
      whereArgs: [partie.id],
    );
    return result;
  }

  /// Récupère la liste des parties
  Future<List<Partie>> recupereParties() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('parties');
    return queryResult.map((e) => Partie.fromMap(e)).toList();
  }

  /// Supprime une partie
  Future<void> deletePartie(int id) async {
    final db = await initializeDB();
    await db.delete(
      'parties',
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
