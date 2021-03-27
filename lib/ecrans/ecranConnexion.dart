import 'package:belote/classes/profil.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EcranConnexion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0),
                child: CircleAvatar(
                  child: ClipOval(
                    child: Image(
                      image: AssetImage('assets/images/belote.jpeg'),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: TextButton(
                child: Text(
                  'Se connecter...',
                  style: GoogleFonts.dancingScript(fontSize: 50.0,),
                ),
                onPressed: () {
                  Provider.of<Profil>(context, listen: false)
                      .initialiseProfil();
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/accueil', (route) => false);
                  print("Connection");
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
