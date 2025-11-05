import 'package:get_it/get_it.dart';
import 'package:test_project/app/features/jsonplaceholder/cubit/dummy_cubit.dart';
import 'package:test_project/app/features/jsonplaceholder/data/dummy_repository.dart';
import 'package:test_project/app/features/theme/cubit/theme_cubit.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  // Repositories
  sl.registerLazySingleton<DummyRepository>(() => DummyRepository());

  // Cubits
  sl.registerFactory<ThemeCubit>(() => ThemeCubit());
  sl.registerFactory<DummyCubit>(() => DummyCubit(sl<DummyRepository>()));
}
