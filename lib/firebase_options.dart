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
    apiKey: 'AIzaSyC8brKLbb6hToPmLEK8a1F8ydDstp18_eg',
    appId: '1:1071096255965:web:b0c83a7dae9549befe1234',
    messagingSenderId: '1071096255965',
    projectId: 'telkomedikaapp-a6e72',
    authDomain: 'telkomedikaapp-a6e72.firebaseapp.com',
    storageBucket: 'telkomedikaapp-a6e72.firebasestorage.app',
    measurementId: 'G-Z3RTGE873X',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD5QGE3RIfyHU2onae6lfxg5I_WDN53YoU',
    appId: '1:1071096255965:android:0a3535f563a432a4fe1234',
    messagingSenderId: '1071096255965',
    projectId: 'telkomedikaapp-a6e72',
    storageBucket: 'telkomedikaapp-a6e72.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBwmNPS5gr-mc5P7GoNeU-1UaLwev8Thd8',
    appId: '1:1071096255965:ios:df201df6d74d715dfe1234',
    messagingSenderId: '1071096255965',
    projectId: 'telkomedikaapp-a6e72',
    storageBucket: 'telkomedikaapp-a6e72.firebasestorage.app',
    iosBundleId: 'com.example.telkomedikaApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBwmNPS5gr-mc5P7GoNeU-1UaLwev8Thd8',
    appId: '1:1071096255965:ios:df201df6d74d715dfe1234',
    messagingSenderId: '1071096255965',
    projectId: 'telkomedikaapp-a6e72',
    storageBucket: 'telkomedikaapp-a6e72.firebasestorage.app',
    iosBundleId: 'com.example.telkomedikaApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC8brKLbb6hToPmLEK8a1F8ydDstp18_eg',
    appId: '1:1071096255965:web:53986f980eea5989fe1234',
    messagingSenderId: '1071096255965',
    projectId: 'telkomedikaapp-a6e72',
    authDomain: 'telkomedikaapp-a6e72.firebaseapp.com',
    storageBucket: 'telkomedikaapp-a6e72.firebasestorage.app',
    measurementId: 'G-N7GZEDZL7S',
  );

}