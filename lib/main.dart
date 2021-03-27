import 'package:belote/classes/profil.dart';
import 'package:belote/ecrans/ecranConnexion.dart';
import 'package:belote/ecrans/ecranProfil.dart';
import 'package:flutter/material.dart';
import 'package:belote/ecrans/ecranAccueil.dart';
import 'package:belote/ecrans/ecranPartie.dart';
import 'package:belote/ecrans/ecranNouvellePartie.dart';
import 'package:provider/provider.dart';
import 'package:belote/ecrans/ecranApropos.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Profil>(
      create: (context) => Profil(),
      child: MaterialApp(
        title: 'Belote',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => EcranConnexion(),
          '/accueil': (context) => EcranAccueil(),
          '/partie': (context) => EcranPartie(),
          '/nouvelle_partie': (context) => EcranNouvellePartie(),
          '/profil': (context) => EcranProfil(),
          '/a_propos': (context) => EcranApropos(),
        },
      ),
    );
  }
}
