import 'package:get_it/get_it.dart';
import 'package:test_project/app/features/init/data/datasources/comment_api_service.dart';
import 'package:test_project/app/features/theme/cubit/theme_cubit.dart';
import 'package:test_project/core/services/api/base_network.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  // Services
  sl.registerLazySingleton<BaseNetwork>(() => BaseNetwork());
  sl.registerLazySingleton<CommentApiService>(() => CommentApiService());

  // Repositories
  // sl.registerLazySingleton<AuthRepository>(() => AuthRepository(sl()));

  // Cubits
  sl.registerFactory<ThemeCubit>(() => ThemeCubit());
}
