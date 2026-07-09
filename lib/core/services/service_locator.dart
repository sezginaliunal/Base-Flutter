import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:dio/dio.dart';

import '../../features/auth/data/datasources/auth_remote_data_source.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/presentation/cubit/auth_cubit.dart';
import '../constants/app_constants.dart';
import '../network/dio_client.dart';
import '../network/interceptors/auth_interceptor.dart';
import '../theme/theme_cubit.dart';

/// Service locator for dependency injection
class ServiceLocator {
  static final GetIt sl = GetIt.instance;

  /// Initialize all dependencies
  static Future<void> init() async {
    // Initialize Hive
    await Hive.initFlutter();

    // Open Hive boxes
    await _openHiveBoxes();

    // Register core dependencies
    await _registerCoreDependencies();

    // Register feature dependencies
    _registerFeatureDependencies();
  }

  /// Open Hive boxes
  static Future<void> _openHiveBoxes() async {
    await Hive.openBox(AppConstants.settingsBoxName);
    await Hive.openBox(AppConstants.authBoxName);
  }

  /// Register core dependencies
  static Future<void> _registerCoreDependencies() async {
    // Dio
    final dio = Dio();
    final authInterceptor = AuthInterceptor(dio);
    final dioClient = DioClient(authInterceptor: authInterceptor);

    sl.registerLazySingleton(() => dio);
    sl.registerLazySingleton(() => authInterceptor);
    sl.registerLazySingleton(() => dioClient);

    // Theme Cubit
    final settingsBox = Hive.box(AppConstants.settingsBoxName);
    sl.registerFactory(() => ThemeCubit(settingsBox));
  }

  /// Register feature dependencies
  static void _registerFeatureDependencies() {
    // Auth Feature
    final dioClient = sl<DioClient>();
    final authRemoteDataSource = AuthRemoteDataSource(dioClient);
    final authRepository = AuthRepositoryImpl(authRemoteDataSource);

    sl.registerLazySingleton(() => authRemoteDataSource);
    sl.registerLazySingleton<AuthRepository>(() => authRepository);
    sl.registerFactory(() => AuthCubit(authRepository));
  }

  /// Reset all dependencies (for testing)
  static Future<void> reset() async {
    await sl.reset();
  }
}
