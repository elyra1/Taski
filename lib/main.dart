import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/di/locator.dart';
import 'package:taski/presentation/navigation/auto_router.dart';

void main() async {
  await initDependencies();
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
