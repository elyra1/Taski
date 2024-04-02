import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @singleton
  FirebaseFirestore fireStore() => FirebaseFirestore.instance;

  @singleton
  FirebaseAuth firebaseAuth() => FirebaseAuth.instance;

  @singleton
  FirebaseMessaging firebaseMessaging() => FirebaseMessaging.instance;

  @singleton
  FirebaseAnalytics firebaseAnalytics() => FirebaseAnalytics.instance;
}
