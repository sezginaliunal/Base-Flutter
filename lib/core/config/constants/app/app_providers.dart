import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/app.dart';
import 'package:test_project/app/features/jsonplaceholder/cubit/dummy_cubit.dart';
import 'package:test_project/app/features/theme/cubit/theme_cubit.dart';
import 'package:test_project/core/config/init/service_locator.dart';

class AppProviders {
  // 🔒 Singleton pattern
  static final AppProviders _instance = AppProviders._internal();
  factory AppProviders() => _instance;
  AppProviders._internal();
  MultiBlocProvider get myApp => _myApp();

  MultiBlocProvider _myApp() => MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => sl<ThemeCubit>()..loadTheme()),
      BlocProvider(create: (_) => sl<DummyCubit>()),
    ],
    child: const MyApp(),
  );
}
