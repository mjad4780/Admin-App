import 'dart:developer';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

// import 'local_notifications_service.dart';

class PushNotificationsService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  static Future init() async {
    await messaging.requestPermission();

    // await messaging.getToken().then((value) {
    //   sendTokenToServer(value!);
    // });
    // messaging.onTokenRefresh.listen((value) {
    //   sendTokenToServer(value);
    // });
    FirebaseMessaging.onBackgroundMessage(handlebackgroundMessage);
    //foreground
    handleForegroundMessage();
    // messaging.subscribeToTopic('all').then((val) {
    //   log('sub');
    // });

    // messaging.unsubscribeFromTopic('all');
    initializeFCM();
  }

  static Future<void> handlebackgroundMessage(RemoteMessage message) async {
    await Firebase.initializeApp();
    log(message.notification?.title ?? 'null');
  }

  static void handleForegroundMessage() {
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        // show local notification
        // LocalNotificationService.showBasicNotification(
        //   message,
        // );
      },
    );
  }

  static void sendTokenToServer(String token) {
    // option 1 => API
    // option 2 => Firebase
  }

  static void initializeFCM() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Received a message while in the foreground!');
      print('Message data: ${message.data}');

      // تسجيل الحدث عند عرض الإشعار
      analytics.logEvent(
        name: 'notification_received',
        parameters: {
          'notification_id': message.data['notification_id'],
        },
      );

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');

      // تسجيل الحدث عند الضغط على الإشعار
      analytics.logEvent(
        name: 'notification_clicked',
        parameters: {
          'notification_id': message.data['notification_id'],
        },
      );
    });
  }
}
/*
  1.Permissions [done]
  2.fcm token [done]
  3.test using token with Firebase [done]
  4.fire notification [background] [done]
  5.fire notification [killed] [done]
  6.fire notification [foreground] [done]
  7.test using token with Postman [done]
  8.send Image with notification [done]
  9.send notfification with custom sound [done]
  10.send token to server [done]
  11.topic [done]
 */
