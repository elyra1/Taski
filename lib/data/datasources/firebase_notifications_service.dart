import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';

@injectable
class FirebaseNotificationService {
  final FirebaseMessaging fcm;
  final FirebaseAuth firebaseAuth;
  FirebaseNotificationService(this.fcm, this.firebaseAuth);

  Future<void> checkPermissionsAndInit() async {
    Permission.notification.isDenied.then((value) async {
      if (value) {
        Permission.notification.request().then((value) async {
          if (value.isGranted) await initialize();
        });
      } else {
        await initialize();
      }
    });
  }

  Future<void> initialize() async {
    final token = await getToken();
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    var initializationSettingsAndroid = const AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );

    if (token != null) {
      String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
      String serverUrl = 'http://79.174.80.218:8080/register-token';
      try {
        var response = await http.post(
          Uri.parse(serverUrl),
          headers: {'Content-Type': 'application/json'},
          body: json.encode({'userId': userId, 'token': token}),
        );

        if (response.statusCode == 200) {
          log('FCM token registered successfully');
        } else {
          log('Failed to register FCM token');
        }
      } catch (e) {
        log(e.toString());
      }
    }

    var initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);

    var android = const AndroidNotificationDetails(
      'my_app_channel',
      'my_app_channel',
      importance: Importance.max,
      priority: Priority.high,
    );

    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        if (message.notification != null) {
          if (Platform.isAndroid) {
            flutterLocalNotificationsPlugin.show(
              2,
              message.notification!.title,
              message.notification!.body,
              NotificationDetails(android: android),
            );
          }
        }
      },
    );
  }

  Future<String?> getToken() async {
    String? token = await fcm.getToken();
    return token;
  }
}
