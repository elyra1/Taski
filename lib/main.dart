import 'dart:async';
import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:taski/data/datasources/firebase_notifications_service.dart';
import 'package:taski/di/locator.dart';
import 'package:taski/domain/entities/task.dart';
import 'package:taski/firebase_options.dart';
import 'package:taski/presentation/navigation/auto_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initDependencies();

  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request().then((value) {
        if (value.isGranted) initializeService();
      });
    } else {
      initializeService();
    }
  });

  runApp(const TaskiApp());
}

class TaskiApp extends StatefulWidget {
  const TaskiApp({super.key});

  @override
  State<TaskiApp> createState() => _TaskiAppState();
}

class _TaskiAppState extends State<TaskiApp> {
  final _appRouter = AppRouter();
  @override
  void initState() {
    getIt.registerSingleton<AppRouter>(_appRouter);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return DefaultTextHeightBehavior(
          textHeightBehavior: const TextHeightBehavior(
            leadingDistribution: TextLeadingDistribution.even,
          ),
          child: MaterialApp.router(
            title: "Taski",
            debugShowCheckedModeBanner: false,
            routerConfig: _appRouter.config(),
          ),
        );
      },
    );
  }
}

Future<void> initializeService() async {
  final service = FlutterBackgroundService();

  await service.configure(
    androidConfiguration: AndroidConfiguration(
      onStart: initBackgroundNotificationService,
      autoStart: true,
      isForegroundMode: false,
    ),
    iosConfiguration: IosConfiguration(),
  );
}

Future<void> initBackgroundNotificationService(ServiceInstance service) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  await initDependencies();
  final fns = getIt<FirebaseNotificationService>();
  await fns.initialize();

  Timer.periodic(const Duration(seconds: 20), (timer) async {
    fns.send(Task.getEmpty());
  });
}
