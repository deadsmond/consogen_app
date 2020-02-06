import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

import './resources/routes/MainRoute.dart';
import './resources/routes/SettingsRoute.dart';
import './resources/routes/AboutRoute.dart';


String initScreen;

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefService.init(prefix: 'pref_');

  PrefService.setDefaultValues({
    'project_description': 'FlatMapp prototype',
    'start_page': 'Map',
    'ui_theme': 'light',
  });

  // get start page
  initScreen = PrefService.get('start_page');
  switch(initScreen) {
    case 'About': {initScreen = '/about';} break;
    case 'Main': {initScreen = '/main';} break;
    case 'Settings': {initScreen = '/settings';} break;
    default: { throw Exception('wrong start_page value: $initScreen'); } break;
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return new DynamicTheme(
        defaultBrightness: Brightness.light,
        data: (brightness) => new ThemeData(
            brightness: brightness, accentColor: Colors.redAccent),
        themedWidgetBuilder: (context, theme){
          return MaterialApp(
            title: 'FlatMApp',
            debugShowCheckedModeBanner: false,
            theme: theme,
            initialRoute: initScreen,
            routes: {
              // When navigating to the "/name" route, build the NameRoute widget.
              '/main': (context) => MainRoute(),
              '/settings': (context) => SettingsRoute(),
              '/about': (context) => AboutRoute(),
            },
          );
        }
    );
  }
}
