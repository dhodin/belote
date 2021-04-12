import 'package:flutter/material.dart';

class EcranProfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Mon profil"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50.0,
            ),
            CircleAvatar(
              radius: 100.0,
              child: ClipOval(
                child: Image(
                  image: AssetImage('assets/images/test.gif'),
                ),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Pseudo',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
