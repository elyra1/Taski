import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:taski/data/datasources/firebase_notifications_service.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:taski/di/locator.dart';
import 'package:taski/firebase_options.dart';
import 'package:taski/presentation/navigation/auto_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initDependencies();
  initializeDateFormatting();

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

void initializeService() async {
  final fns = getIt<FirebaseNotificationService>();
  await fns.initialize();
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
