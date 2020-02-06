import 'package:flutter/material.dart';

import '../objects/widgets/side_bar_menu.dart';
import '../objects/widgets/bottom_navigation_bar.dart';
import '../objects/widgets/app_bar.dart';
import '../objects/widgets/text_styles.dart';


class AboutRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body:

      // BODY
      ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            ListTile(
              title: Text(
                'About',
                style: header(),
              ),
              leading: Icon(Icons.info_outline),
            ),
            ListTile(
              title: Text(
                'Consogen is a conspiracy generator, that allows to generate '
                'connection from random article to anything... or Illuminati.\n',
                style: bodyText(),
              ),
            ),
            ListTile(
              title: Text(
                'Consogen is free to use and is not gathering any personal data '
                'without user consent. All data gathered from application, such '
                'as user settings or locations are anonymized before gathering.\n',
                style: bodyText(),
              ),
            ),

            footerTile(),
          ],
        ).toList(),
      ),

      // SIDE PANEL MENU
      drawer: sideBarMenu(context),

      // NAVIGATION BAR
      floatingActionButton: navigationBarButton(context),
    );
  }
}
