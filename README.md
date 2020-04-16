# consogen_app

Consogen mobile application

Previous versions:
*

**Current version:**
* **v0.0.1:** basic interface introduced

Incoming version:
*

Project website: (Deadsmond Consogen)[https://deadsmond.pythonanywhere.com/consogen]

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Installing project

* Download repository to your desired location. 
* Flutter requires **Android Studio** for Android deployment. 

    Recommended IDLE to code is **Android Studio**.

* Remember to install **Flutter** plugin, following [these instructions](https://flutter.dev/docs/get-started/install).
* install packages required for this project with `flutter pub get`, run in **your project folder!**

    Any additional packages should be implemented in **pubspec.yaml file** and installed as written above.

## Tutorials

Flutter app design: 
* [Cookbook](https://flutter.dev/docs/cookbook)
* [interface](https://flutter.dev/docs/development/ui/widgets-intro)
* [architecture](https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple)
* [testing](https://flutter.dev/docs/testing)

Optimization: 
* [app size](https://flutter.dev/docs/perf/app-size)
* [performance](https://flutter.dev/docs/perf/rendering/best-practices)

## Technical details
* ConsogenApp current min SDKVersion (Android level) is 18.
* App main colour is `HEX: F4511E`.
* Custom icons were created in [Android Asset Studio Launcher icon generator](https://romannurik.github.io/AndroidAssetStudio/icons-launcher.html#foreground.type=clipart&foreground.clipart=remove_red_eye&foreground.space.trim=0&foreground.space.pad=-0.05&foreColor=rgb(216%2C%2057%2C%201)&backColor=rgb(255%2C%20255%2C%20255)&crop=0&backgroundShape=none&effects=score&name=ic_launcher)
* No custom icons for iOS are developed yet.
* New screens (or views) should be operated by Navigator as in [this example](https://flutter.dev/docs/cookbook/navigation/named-routes).
* Custom loading screen can be added as shown in [this medium tutorial](https://medium.com/@jongzpuangput/flutter-splash-screen-5c8a0001721b).

### API


### Routes
Routes are application views. Each new screen presented in the app 
is another route.

Currently ConsogenApp uses 3 routes:

1. MainRoute - main view;
2. SettingsRoute - view of application settings;
3. AboutRoute - about page, presenting basic information about team,
license and application fundations; 

## Notes

### Debugging notes
none

### On reading Future values

Dart utilizes specific form of asynchronous processing, called Future.
Future objects allow application to work while their work is not finished.

Reading Future\<String\> value results in returning "Instance of Future\<String>" response, 
not actual content of variable, due to the asynchronicity thereof.  

If the Future objects are being accessed too fast (before the Future happened), 
application will fail to load them as `null` value would be returned 
(as the object itself exists in the future).

This can be prevented with example coding 
([documentation](https://dart.dev/codelabs/async-await)):

```dart
// use async library
import 'dart:async';
```
```dart
class A {
  Future<int> getInt() {
    return Future.value(10);
  }
}

class B {
  checkValue() async {
    final val = await A().getInt();
    print(val == 10 ? "yes" : "no");
  }
}
```
```dart
void foo() async {
  final user = await _fetchUserInfo(id);
}

Future someMethod() async {
  String s = await someFuncThatReturnsFuture();
}
```
```dart
someMethod() {
  someFuncTahtReturnsFuture().then((s) {
    print(s);
  });
}
```
---
