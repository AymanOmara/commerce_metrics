library di;

import 'package:di/repositories_injector.dart';
import 'package:di/use_case_injector.dart';
import 'package:get_it/get_it.dart';

var diInjector = GetIt.I;

class DI {
  DI._();

  static void registerDependencies() {
    setupRepositoryInjector(diInjector);
    setupUseCaseInjector(diInjector);
  }
}
