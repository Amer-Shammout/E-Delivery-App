import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';

abstract class FirebaseNotification {
  static String? fcmToken;
  static Future<void> getFCMToken() async {
    final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    await firebaseMessaging.requestPermission();
    fcmToken = await firebaseMessaging.getToken();
    log(fcmToken ?? 'no token');
  }
}
