import 'dart:async';
import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:taski/data/datasources/firebase_notifications_service.dart';
import 'package:taski/di/locator.dart';
import 'package:taski/domain/repositories/auth_repository.dart';
import 'package:taski/domain/repositories/task_repository.dart';
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
      autoStartOnBoot: true,
      isForegroundMode: false,
    ),
    iosConfiguration: IosConfiguration(),
  );
}

@pragma('vm:entry-point')
Future<void> initBackgroundNotificationService(ServiceInstance service) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  await initDependencies();
  final fns = getIt<FirebaseNotificationService>();
  await fns.initialize();

  getIt<TaskRepository>()
      .getUserTasks(userId: (await getIt<AuthRepository>().getCurrentUser()).id)
      .listen((event) {
    checkTasksAndSendNotifications(fns);
  });

  Timer.periodic(const Duration(minutes: 1), (_) {
    checkTasksAndSendNotifications(fns);
  });
}

Future<void> checkTasksAndSendNotifications(
    FirebaseNotificationService fns) async {
  final allTasks = await getIt<TaskRepository>().getAllTodayUserTasks();
  for (var task in allTasks) {
    final diffInSeconds =
        task.startTime.toDate().difference(DateTime.now()).inSeconds;
    if (diffInSeconds < 900 &&
        diffInSeconds >= 0 &&
        !task.isNotificationSended) {
      await getIt<TaskRepository>().changeIsNotificationSended(task: task);
      fns.send(task);
    }
  }
}
