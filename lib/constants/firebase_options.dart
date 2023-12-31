// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyAMNfAkB6bv9jb7ovPFu7V4LuBWr5lJrZM',
    appId: '1:631439784330:web:74feac7b79aab6ee1b3073',
    messagingSenderId: '631439784330',
    projectId: 'feedback-app-444',
    authDomain: 'feedback-app-444.firebaseapp.com',
    databaseURL:
        'https://feedback-app-444-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'feedback-app-444.appspot.com',
    measurementId: 'G-J262ZEJPJL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyABuSEdncmmXwblnDGUgo0xKksEQvynFrk',
    appId: '1:631439784330:android:123a9df612c096ca1b3073',
    messagingSenderId: '631439784330',
    projectId: 'feedback-app-444',
    databaseURL:
        'https://feedback-app-444-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'feedback-app-444.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDTikRMwOiTxOLOsYRIis2m4t7TmbcDYnM',
    appId: '1:631439784330:ios:197daccc3c750f581b3073',
    messagingSenderId: '631439784330',
    projectId: 'feedback-app-444',
    databaseURL:
        'https://feedback-app-444-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'feedback-app-444.appspot.com',
    iosBundleId: 'com.example.feedbackApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDTikRMwOiTxOLOsYRIis2m4t7TmbcDYnM',
    appId: '1:631439784330:ios:2aad228e2874a5a51b3073',
    messagingSenderId: '631439784330',
    projectId: 'feedback-app-444',
    databaseURL:
        'https://feedback-app-444-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'feedback-app-444.appspot.com',
    iosBundleId: 'com.example.feedbackApp.RunnerTests',
  );
}
