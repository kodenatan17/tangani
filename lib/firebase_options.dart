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
    apiKey: 'AIzaSyB7jn5PKEcCXyzsNpZjMQqHCYFSv6Re59w',
    appId: '1:685704792433:web:e05eb8daf5599990cd4ed0',
    messagingSenderId: '685704792433',
    projectId: 'tangani-457b8',
    authDomain: 'tangani-457b8.firebaseapp.com',
    storageBucket: 'tangani-457b8.appspot.com',
    measurementId: 'G-ERV4FY98MP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDRn43PQgPbcsdAA3RG9uZ6D2PG15ZuUF4',
    appId: '1:685704792433:android:5d6b20bd5444f791cd4ed0',
    messagingSenderId: '685704792433',
    projectId: 'tangani-457b8',
    storageBucket: 'tangani-457b8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCaBs4GBPAR6VS-LEElIn-qXRjCiO_QmXM',
    appId: '1:685704792433:ios:fd0e1c167a59ce4bcd4ed0',
    messagingSenderId: '685704792433',
    projectId: 'tangani-457b8',
    storageBucket: 'tangani-457b8.appspot.com',
    androidClientId: '685704792433-1gjg0doemr0cr1gvjpfdka1fnp6jnh2i.apps.googleusercontent.com',
    iosClientId: '685704792433-ido33dnphf3o50rti31e5i41tccfnvel.apps.googleusercontent.com',
    iosBundleId: 'com.kodenatan.tangani.tangani',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCaBs4GBPAR6VS-LEElIn-qXRjCiO_QmXM',
    appId: '1:685704792433:ios:fd0e1c167a59ce4bcd4ed0',
    messagingSenderId: '685704792433',
    projectId: 'tangani-457b8',
    storageBucket: 'tangani-457b8.appspot.com',
    androidClientId: '685704792433-1gjg0doemr0cr1gvjpfdka1fnp6jnh2i.apps.googleusercontent.com',
    iosClientId: '685704792433-ido33dnphf3o50rti31e5i41tccfnvel.apps.googleusercontent.com',
    iosBundleId: 'com.kodenatan.tangani.tangani',
  );
}
