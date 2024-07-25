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
    apiKey: 'AIzaSyDpE5CYeSHysQsyiu2d2iX1MxR7CEI0Ujw',
    appId: '1:237528939048:web:ef085cc9f02a02990ed31d',
    messagingSenderId: '237528939048',
    projectId: 'e-ecommerce-f3bee',
    authDomain: 'e-ecommerce-f3bee.firebaseapp.com',
    storageBucket: 'e-ecommerce-f3bee.appspot.com',
    measurementId: 'G-H1GFE7GQ2K',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD4YAlJdb6Wj0V2kAJKnXgk0_pBVYQ20uI',
    appId: '1:237528939048:android:1e1511f75b32f0470ed31d',
    messagingSenderId: '237528939048',
    projectId: 'e-ecommerce-f3bee',
    storageBucket: 'e-ecommerce-f3bee.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDz_E5niJk-i7ZT1ss_90c-IF3WUT5jFko',
    appId: '1:237528939048:ios:b566d4a8d234d6de0ed31d',
    messagingSenderId: '237528939048',
    projectId: 'e-ecommerce-f3bee',
    storageBucket: 'e-ecommerce-f3bee.appspot.com',
    androidClientId: '237528939048-pmnhtgg71326h1836flk2d72vvmjgi6o.apps.googleusercontent.com',
    iosClientId: '237528939048-dv2ak3maeil7900ndnpm4oju8moptr1n.apps.googleusercontent.com',
    iosBundleId: 'com.example.untitled',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDz_E5niJk-i7ZT1ss_90c-IF3WUT5jFko',
    appId: '1:237528939048:ios:b566d4a8d234d6de0ed31d',
    messagingSenderId: '237528939048',
    projectId: 'e-ecommerce-f3bee',
    storageBucket: 'e-ecommerce-f3bee.appspot.com',
    androidClientId: '237528939048-pmnhtgg71326h1836flk2d72vvmjgi6o.apps.googleusercontent.com',
    iosClientId: '237528939048-dv2ak3maeil7900ndnpm4oju8moptr1n.apps.googleusercontent.com',
    iosBundleId: 'com.example.untitled',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDpE5CYeSHysQsyiu2d2iX1MxR7CEI0Ujw',
    appId: '1:237528939048:web:0e87b6464f32f07f0ed31d',
    messagingSenderId: '237528939048',
    projectId: 'e-ecommerce-f3bee',
    authDomain: 'e-ecommerce-f3bee.firebaseapp.com',
    storageBucket: 'e-ecommerce-f3bee.appspot.com',
    measurementId: 'G-NPLY6SL5K3',
  );
}