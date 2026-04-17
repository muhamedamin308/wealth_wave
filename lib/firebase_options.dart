// ignore_for_file: type=lint

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform, kIsWeb;
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Values are loaded from `.env`, which must be loaded before accessing
/// [DefaultFirebaseOptions.currentPlatform].
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
          'DefaultFirebaseOptions have not been configured for macos.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static FirebaseOptions get web => FirebaseOptions(
        apiKey: _getEnv('FIREBASE_WEB_API_KEY'),
        appId: _getEnv('FIREBASE_WEB_APP_ID'),
        messagingSenderId: _getEnv('FIREBASE_MESSAGING_SENDER_ID'),
        projectId: _getEnv('FIREBASE_PROJECT_ID'),
        authDomain: _getEnv('FIREBASE_AUTH_DOMAIN'),
        storageBucket: _getEnv('FIREBASE_STORAGE_BUCKET'),
        measurementId: _getEnv('FIREBASE_MEASUREMENT_ID'),
      );

  static FirebaseOptions get android => FirebaseOptions(
        apiKey: _getEnv('FIREBASE_ANDROID_API_KEY'),
        appId: _getEnv('FIREBASE_ANDROID_APP_ID'),
        messagingSenderId: _getEnv('FIREBASE_MESSAGING_SENDER_ID'),
        projectId: _getEnv('FIREBASE_PROJECT_ID'),
        storageBucket: _getEnv('FIREBASE_STORAGE_BUCKET'),
      );

  static FirebaseOptions get ios => FirebaseOptions(
        apiKey: _getEnv('FIREBASE_IOS_API_KEY'),
        appId: _getEnv('FIREBASE_IOS_APP_ID'),
        messagingSenderId: _getEnv('FIREBASE_MESSAGING_SENDER_ID'),
        projectId: _getEnv('FIREBASE_PROJECT_ID'),
        storageBucket: _getEnv('FIREBASE_STORAGE_BUCKET'),
        iosBundleId: _getEnv('FIREBASE_IOS_BUNDLE_ID'),
      );

  static String _getEnv(String key) {
    final value = dotenv.env[key];
    if (value == null || value.isEmpty) {
      throw UnsupportedError('Missing required environment variable: $key');
    }
    return value;
  }
}
