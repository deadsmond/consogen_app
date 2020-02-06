import 'package:flutter/material.dart';
import 'text_styles.dart';


ListTile sideBarMenuElement(context, String name, Icon icon, String route){
  return ListTile(
    leading: icon,
    title: Text(name, style: sideBarMenuStyle(),),
    onTap: () {
      // Then close the drawer
      Navigator.pop(context);
      // Navigate to the profile screen using a named route.
      Navigator.pushNamed(context, route);
    },
  );
}

Drawer sideBarMenu(context){
  return Drawer(
    // Add a ListView to the drawer. This ensures the user can scroll
    // through the options in the drawer if there isn't enough vertical
    // space to fit everything.
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        Container(
          height: 80.0,
          child: DrawerHeader(
              child:
              Text('', style: TextStyle(color: Colors.white)),
              decoration: BoxDecoration(
                  color: Colors.redAccent
              ),
              margin: EdgeInsets.all(0.0),
              padding: EdgeInsets.all(0.0)
          ),
        ),
        sideBarMenuElement(context, 'Generator', Icon(Icons.remove_red_eye), '/generator'),
        sideBarMenuElement(context, 'Settings', Icon(Icons.settings_applications), '/settings'),
        sideBarMenuElement(context, 'About', Icon(Icons.info_outline), '/about'),
      ],
    ),
  );
}