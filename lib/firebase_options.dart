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
    apiKey: 'AIzaSyBUY1WUfvSOIBa3wB1Kzy5Xg-LZVyN-EXU',
    appId: '1:627251733579:web:0e103170a6002a59ab59ce',
    messagingSenderId: '627251733579',
    projectId: 'tiktok-5c10f',
    authDomain: 'tiktok-5c10f.firebaseapp.com',
    storageBucket: 'tiktok-5c10f.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAFVCBr0MlqWw-TN2oHlm0aWj9eQ7L3b1Y',
    appId: '1:627251733579:android:7fee69604c8cd0d4ab59ce',
    messagingSenderId: '627251733579',
    projectId: 'tiktok-5c10f',
    storageBucket: 'tiktok-5c10f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCl9W9COiJgKWhEaRtCx46Z5Jv1G5a1UiA',
    appId: '1:627251733579:ios:ceb4f0b92608651aab59ce',
    messagingSenderId: '627251733579',
    projectId: 'tiktok-5c10f',
    storageBucket: 'tiktok-5c10f.appspot.com',
    iosBundleId: 'com.example.tiktokClone',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCl9W9COiJgKWhEaRtCx46Z5Jv1G5a1UiA',
    appId: '1:627251733579:ios:ceb4f0b92608651aab59ce',
    messagingSenderId: '627251733579',
    projectId: 'tiktok-5c10f',
    storageBucket: 'tiktok-5c10f.appspot.com',
    iosBundleId: 'com.example.tiktokClone',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBUY1WUfvSOIBa3wB1Kzy5Xg-LZVyN-EXU',
    appId: '1:627251733579:web:e90adfad775e34dbab59ce',
    messagingSenderId: '627251733579',
    projectId: 'tiktok-5c10f',
    authDomain: 'tiktok-5c10f.firebaseapp.com',
    storageBucket: 'tiktok-5c10f.appspot.com',
  );
}
