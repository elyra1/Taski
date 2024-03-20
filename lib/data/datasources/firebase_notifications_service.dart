import 'dart:convert';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:taski/domain/entities/task.dart';
import 'package:taski/presentation/utils/app_date_utils.dart';

@injectable
class FirebaseNotificationService {
  final FirebaseMessaging fcm;
  FirebaseNotificationService(this.fcm);
  final serverKey =
      "AAAA5bT7Xm4:APA91bE9sMgLDbXI5rRa7PgaOxjfELLaa12pXc3dtR0FrANxFxrPUD1z6XHUjb-s-Oso6kt8DpbIuuufpIRJaXAE-7JomhBZm1LVgYD3sKRys78GNtSp2hNBaqROpkprca-z_kwBYr2n";
  final postUrl = 'https://fcm.googleapis.com/fcm/send';

  Future initialize() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    var initializationSettingsAndroid = const AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );

    var initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);

    var android = const AndroidNotificationDetails(
      'my_app_channel',
      'my_app_channel',
      channelDescription: 'channel description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );

    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        if (message.notification != null) {
          if (Platform.isAndroid) {
            flutterLocalNotificationsPlugin.show(
              1,
              message.notification?.title,
              message.notification?.body,
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

  Future<void> send(Task task) async {
    final data = {
      "notification": {
        "body":
            "В ${AppDateUtils.toHHMM(task.startTime.toDate())} запланирована задача: ${task.title}",
        "title": "Taski",
      },
      "priority": "high",
      "data": {
        "click_action": "FLUTTER_NOTIFICATION_CLICK",
        "id": '1',
        "status": "done"
      },
      "to": await fcm.getToken(),
    };

    final headers = {
      'content-type': 'application/json',
      'Authorization': 'key=$serverKey'
    };

    await http.post(
      Uri.parse(postUrl),
      body: json.encode(data),
      encoding: Encoding.getByName('utf-8'),
      headers: headers,
    );
  }
}
