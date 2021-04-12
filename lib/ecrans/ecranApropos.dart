import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class EcranApropos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("A propos..."),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 20.0, 0, 20.0),
            child: Text(
              "Belote",
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Text(
              "Version 1.0.0",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 20.0),
            child: Text(
              "by inHod",
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
          ),
          const Divider(
            color: Colors.grey,
            height: 20.0,
            indent: 20.0,
            endIndent: 20.0,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0),
            child: Card(
              child: ListTile(
                title: Text("Règles officielles (FFB)..."),
                onTap: () {
                  launch(
                      "http://www.ffbelote.org/reglements-de-la-belote-avec-ou-sans-annonce/");
                },
                dense: false,
                trailing: Icon(FontAwesomeIcons.handSparkles),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
            child: Card(
              child: ListTile(
                title: Text("Nous connaitre..."),
                onTap: () {
                  launch("https://inhod.com/");
                },
                dense: false,
                trailing: Icon(FontAwesomeIcons.handSparkles),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
