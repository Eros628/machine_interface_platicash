// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCKWCo1TBNYxDaeEZ76BgA8IYbEoDI1ABM',
    appId: '1:639952440712:web:a74f613013db01b9d03e3d',
    messagingSenderId: '639952440712',
    projectId: 'plasticash-app',
    authDomain: 'plasticash-app.firebaseapp.com',
    storageBucket: 'plasticash-app.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBOAxEUMog3oZ8RR9Miy-kXtR-sLsRonPw',
    appId: '1:639952440712:android:76f3c157603c156bd03e3d',
    messagingSenderId: '639952440712',
    projectId: 'plasticash-app',
    storageBucket: 'plasticash-app.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyARf5Z4H9nf7YsvGYFinDz8hAlsbvQvweo',
    appId: '1:639952440712:ios:076908931244f4d8d03e3d',
    messagingSenderId: '639952440712',
    projectId: 'plasticash-app',
    storageBucket: 'plasticash-app.firebasestorage.app',
    iosBundleId: 'com.example.interfacePlasticash',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyARf5Z4H9nf7YsvGYFinDz8hAlsbvQvweo',
    appId: '1:639952440712:ios:076908931244f4d8d03e3d',
    messagingSenderId: '639952440712',
    projectId: 'plasticash-app',
    storageBucket: 'plasticash-app.firebasestorage.app',
    iosBundleId: 'com.example.interfacePlasticash',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCKWCo1TBNYxDaeEZ76BgA8IYbEoDI1ABM',
    appId: '1:639952440712:web:cbd52283e43a0c12d03e3d',
    messagingSenderId: '639952440712',
    projectId: 'plasticash-app',
    authDomain: 'plasticash-app.firebaseapp.com',
    storageBucket: 'plasticash-app.firebasestorage.app',
  );
}
