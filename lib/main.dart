import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_project/app.dart';
import 'package:test_project/app/features/jsonplaceholder/dummy_cubit.dart';
import 'package:test_project/app/features/jsonplaceholder/dummy_repository.dart';
import 'package:test_project/app/features/theme/cubit/theme_cubit.dart';
import 'package:test_project/core/config/constants/app/app_infos.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: AppInfos.locale,
      path: AppInfos.translationsBase,
      fallbackLocale: AppInfos.locale.first, //English
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => ThemeCubit()..loadTheme()),
          BlocProvider(
            create: (_) => DummyCubit(DummyRepository()),
          ), // 👈 buraya eklendi
        ],
        child: const MyApp(),
      ),
    ),
  );
}
