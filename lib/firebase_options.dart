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
    apiKey: 'AIzaSyBu-_DZ53bxNyqcH6DJ3uXEcyrl12r-q0M',
    appId: '1:806079595545:web:5d68c70a3a3f0d892b9688',
    messagingSenderId: '806079595545',
    projectId: 'task1-27c57',
    authDomain: 'task1-27c57.firebaseapp.com',
    storageBucket: 'task1-27c57.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCZbxcJKd1wxpQ_ktEGbishvG7BOydVID4',
    appId: '1:806079595545:android:464e3f26e7b42a332b9688',
    messagingSenderId: '806079595545',
    projectId: 'task1-27c57',
    storageBucket: 'task1-27c57.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCXpXNHty2AWTpYl8h05TntxdCHCMWixMs',
    appId: '1:806079595545:ios:b1a33f506bd474bc2b9688',
    messagingSenderId: '806079595545',
    projectId: 'task1-27c57',
    storageBucket: 'task1-27c57.appspot.com',
    iosBundleId: 'com.example.task1',
  );
}