import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_project/app/features/theme/cubit/theme_cubit.dart';
import 'package:test_project/core/services/api/base_network.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  await Hive.initFlutter();

  // Services
  sl.registerLazySingleton<BaseNetwork>(() => BaseNetwork());

  // Repositories
  // sl.registerLazySingleton<AuthRepository>(() => AuthRepository(sl()));

  // Cubits
  sl.registerFactory<ThemeCubit>(() => ThemeCubit());
}
