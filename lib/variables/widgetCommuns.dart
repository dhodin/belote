import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Widget utilisé pour la barre de navigation
class CommunBottomAppBar extends StatelessWidget {
  const CommunBottomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.blueGrey,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          children: <Widget>[
            IconButton(
              tooltip: 'Profil',
              icon: const Icon(FontAwesomeIcons.user),
              onPressed: () {
                Navigator.pushNamed(context, "/profil");
              },
            ),
            IconButton(
              tooltip: 'Search',
              icon: const Icon(FontAwesomeIcons.questionCircle),
              onPressed: () {
                Navigator.pushNamed(context, "/a_propos");
              },
            ),
          ],
        ),
      ),
    );
  }
}
