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
        return macos;
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
    apiKey: 'AIzaSyAhc1h3oQpNtn6oiMGJOTO5pNruwpHCv-0',
    appId: '1:918324361981:web:805b4d50eb9dd1b5451c94',
    messagingSenderId: '918324361981',
    projectId: 'e-comm-de7bd',
    authDomain: 'e-comm-de7bd.firebaseapp.com',
    storageBucket: 'e-comm-de7bd.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCEexTiRLyndyhergD6U_fvQMb13aY9IWk',
    appId: '1:918324361981:android:7b588e078fca3d94451c94',
    messagingSenderId: '918324361981',
    projectId: 'e-comm-de7bd',
    storageBucket: 'e-comm-de7bd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBERFFLnsjcbXPiz4m6NBb_oSCNx5hmepk',
    appId: '1:918324361981:ios:a3a05e9cb888f0e8451c94',
    messagingSenderId: '918324361981',
    projectId: 'e-comm-de7bd',
    storageBucket: 'e-comm-de7bd.appspot.com',
    iosClientId:
        '918324361981-tg4m7963lav19df9n2r3qj91qmbi0sav.apps.googleusercontent.com',
    iosBundleId: 'com.example.eCom',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBERFFLnsjcbXPiz4m6NBb_oSCNx5hmepk',
    appId: '1:918324361981:ios:a3a05e9cb888f0e8451c94',
    messagingSenderId: '918324361981',
    projectId: 'e-comm-de7bd',
    storageBucket: 'e-comm-de7bd.appspot.com',
    iosClientId:
        '918324361981-tg4m7963lav19df9n2r3qj91qmbi0sav.apps.googleusercontent.com',
    iosBundleId: 'com.example.eCom',
  );
}