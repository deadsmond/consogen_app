import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

import '../objects/widgets/side_bar_menu.dart';
import '../objects/widgets/bottom_navigation_bar.dart';
import '../objects/widgets/app_bar.dart';
import '../objects/widgets/text_styles.dart';


class SettingsRoute extends StatefulWidget {
  @override
  _SettingsRouteState createState() => _SettingsRouteState();
}

class _SettingsRouteState extends State<SettingsRoute> {

  PreferencePage easyPreferences(){
    return PreferencePage([
      PreferenceTitle('General', style: header()),
      DropdownPreference(
        'Start Page',
        'start_page',
        defaultVal: 'Generator',
        values: ['Generator', 'Settings', 'About'],
      ),
      PreferenceTitle('Personalization', style: header()),
      RadioPreference(
        'Light Theme',
        'light',
        'ui_theme',
        isDefault: true,
        onSelect: () {
          DynamicTheme.of(context).setBrightness(Brightness.light);
        },
      ),
      RadioPreference(
        'Dark Theme',
        'dark',
        'ui_theme',
        onSelect: () {
          DynamicTheme.of(context).setBrightness(Brightness.dark);
        },
      ),

      footerTile(),

    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body:

      // BODY
      easyPreferences(),

      // SIDE PANEL MENU
      drawer: sideBarMenu(context),

      // NAVIGATION BAR
      floatingActionButton: navigationBarButton(context),
    );
  }
}

