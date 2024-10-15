import 'package:get_it/get_it.dart';
import 'package:sgmasms/core/services/api_client.dart';
import 'package:sgmasms/demo/demo_cubit.dart';

// initialize getIt
GetIt locator = GetIt.instance;

void setupLocator() {
  // bloc
  locator.registerFactory<DemoBloc>(() => DemoBloc());

  // external
  locator.registerLazySingleton<ApiClient>(() => ApiClient());
}
