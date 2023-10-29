import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:taski/di/locator.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> initDependencies() async {
  getIt.init();
}
