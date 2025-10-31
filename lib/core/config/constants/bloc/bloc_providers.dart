import 'package:flutter_bloc/flutter_bloc.dart';

// import bloclar
import 'package:test_project/app/features/init/cubit/init_cubit.dart';
import 'package:test_project/app/features/theme/bloc/theme_cubit.dart';
// diğer bloc importlarını da buraya eklersin

class BlocProviders {
  static final List<BlocProvider> providers = [
    // Lazy olacak, ekrana gelmeden oluşturulmaz
    BlocProvider<InitCubit>(
      lazy: true, // 🔥 ekrana gelmeden oluşturulmaz
      create: (context) => InitCubit()..loadData(),
    ),
    BlocProvider<ThemeCubit>(
      lazy: false,
      create: (context) => ThemeCubit()..loadTheme(),
    ),
  ];
}
