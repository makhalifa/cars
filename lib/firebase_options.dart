// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyB95PzvBwGGziiJGzQgtyPYM1-y-SzTqN8',
    appId: '1:553772770718:web:5a068dda63409f5bcca28f',
    messagingSenderId: '553772770718',
    projectId: 'cark-2ff2e',
    authDomain: 'cark-2ff2e.firebaseapp.com',
    databaseURL: 'https://cark-2ff2e-default-rtdb.firebaseio.com',
    storageBucket: 'cark-2ff2e.appspot.com',
    measurementId: 'G-SL6BLPMWSW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCnsZNHB_gYYpvAFHFBngvo0xc5kHMxYDM',
    appId: '1:553772770718:android:8d81b847032e6491cca28f',
    messagingSenderId: '553772770718',
    projectId: 'cark-2ff2e',
    databaseURL: 'https://cark-2ff2e-default-rtdb.firebaseio.com',
    storageBucket: 'cark-2ff2e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBXC57n3Aastt84a-HIQVgq1MhMMbegoKc',
    appId: '1:553772770718:ios:c6acc31feb1eac15cca28f',
    messagingSenderId: '553772770718',
    projectId: 'cark-2ff2e',
    databaseURL: 'https://cark-2ff2e-default-rtdb.firebaseio.com',
    storageBucket: 'cark-2ff2e.appspot.com',
    iosClientId: '553772770718-fd9jn7j8le5e86up42838ro2m77gi9a5.apps.googleusercontent.com',
    iosBundleId: 'com.example.cars',
  );
}