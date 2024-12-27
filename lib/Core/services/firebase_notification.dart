import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';

abstract class FirebaseNotification {
  static Future<String?> getFCMToken() async {
    final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    await firebaseMessaging.requestPermission();
    String? fcmToken = await firebaseMessaging.getToken();
    log(fcmToken??'no token');
    return fcmToken;
  }
}
