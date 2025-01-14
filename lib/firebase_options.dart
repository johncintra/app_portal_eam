import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.

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
    apiKey: 'AIzaSyDKJJj3xNjeRHHnzLaLV0k6KXoIn1zcJ1w',
    appId: '1:522385781229:web:5937e479bb28346656f7e4',
    messagingSenderId: '522385781229',
    projectId: 'stellar-shard-428316-t9',
    authDomain: 'stellar-shard-428316-t9.firebaseapp.com',
    databaseURL: 'https://stellar-shard-428316-t9-default-rtdb.firebaseio.com',
    storageBucket: 'stellar-shard-428316-t9.appspot.com',
    measurementId: 'G-L9KD942L46',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBhd6_neTLwVjgSTOuXwrvZpj_00-88Ro8',
    appId: '1:522385781229:android:5e9253086ddc74bc56f7e4',
    messagingSenderId: '522385781229',
    projectId: 'stellar-shard-428316-t9',
    databaseURL: 'https://stellar-shard-428316-t9-default-rtdb.firebaseio.com',
    storageBucket: 'stellar-shard-428316-t9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCyQVCVpOKe4W5a71V6lq4Y10vWlAYJZKA',
    appId: '1:522385781229:ios:28930e681d1737ec56f7e4',
    messagingSenderId: '522385781229',
    projectId: 'stellar-shard-428316-t9',
    databaseURL: 'https://stellar-shard-428316-t9-default-rtdb.firebaseio.com',
    storageBucket: 'stellar-shard-428316-t9.appspot.com',
    iosBundleId: 'com.example.portalEam',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCyQVCVpOKe4W5a71V6lq4Y10vWlAYJZKA',
    appId: '1:522385781229:ios:28930e681d1737ec56f7e4',
    messagingSenderId: '522385781229',
    projectId: 'stellar-shard-428316-t9',
    databaseURL: 'https://stellar-shard-428316-t9-default-rtdb.firebaseio.com',
    storageBucket: 'stellar-shard-428316-t9.appspot.com',
    iosBundleId: 'com.example.portalEam',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDKJJj3xNjeRHHnzLaLV0k6KXoIn1zcJ1w',
    appId: '1:522385781229:web:8c9a7d9521a0f31a56f7e4',
    messagingSenderId: '522385781229',
    projectId: 'stellar-shard-428316-t9',
    authDomain: 'stellar-shard-428316-t9.firebaseapp.com',
    databaseURL: 'https://stellar-shard-428316-t9-default-rtdb.firebaseio.com',
    storageBucket: 'stellar-shard-428316-t9.appspot.com',
    measurementId: 'G-5X85YW1QND',
  );
}
