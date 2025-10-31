import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/app/features/init/cubit/init_cubit.dart';
import 'package:test_project/app/features/init/cubit/init_state.dart';
import 'package:test_project/app/features/theme/bloc/theme_cubit.dart';

class InitPage extends StatelessWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => InitCubit()..loadData(),
      child: Scaffold(
        floatingActionButton: IconButton(
          icon: const Icon(Icons.brightness_6),
          onPressed: () {
            context.read<ThemeCubit>().toggleTheme();
          },
        ),
        appBar: AppBar(title: const Text('Cubit State Örneği')),
        body: BlocBuilder<InitCubit, InitState>(
          builder: (context, state) {
            if (state is InitLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is InitErrorState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hata: ${state.message}',
                      style: const TextStyle(color: Colors.red),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => context.read<InitCubit>().loadData(),
                      child: const Text('Tekrar Dene'),
                    ),
                  ],
                ),
              );
            }

            if (state is InitLoadedState) {
              return Column(
                children: [
                  const SizedBox(height: 12),
                  ElevatedButton.icon(
                    onPressed: () {
                      context.read<InitCubit>().sortItems();
                    },
                    icon: const Icon(Icons.sort),
                    label: Text(state.isDescending ? 'Z → A' : 'A → Z'),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.items.length,
                      itemBuilder: (context, index) {
                        return ListTile(title: Text(state.items[index]));
                      },
                    ),
                  ),
                ],
              );
            }

            return const Center(child: Text('Başlangıç durumu'));
          },
        ),
      ),
    );
  }
}
