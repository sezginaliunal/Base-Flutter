import 'package:get_it/get_it.dart';
import 'package:test_project/app/features/theme/cubit/theme_cubit.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  // Repositories

  // Cubits
  sl.registerFactory<ThemeCubit>(() => ThemeCubit());
}
