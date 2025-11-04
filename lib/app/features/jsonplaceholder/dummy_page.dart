import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/app/features/jsonplaceholder/dummy_cubit.dart';
import 'package:test_project/app/features/jsonplaceholder/dummy_repository.dart';
import 'package:test_project/app/features/jsonplaceholder/dummy_state.dart';
import 'package:test_project/core/utils/dialogs.dart';

class DummyPage extends StatelessWidget {
  const DummyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DummyCubit(DummyRepository()),
      child: const _DummyView(),
    );
  }
}

final class _DummyView extends StatelessWidget {
  const _DummyView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dummy Data')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ✅ Butona basıldığında istek at

          context.read<DummyCubit>().fetchData();
        },
        child: const Icon(Icons.refresh),
      ),
      body: BlocListener<DummyCubit, DummyState>(
        listener: (context, state) {
          if (state is DummyDataError) {
            AppUI.showSnack(state.message);
          }
        },
        child: BlocBuilder<DummyCubit, DummyState>(
          builder: (context, state) {
            if (state is DummyDataLoading) {
              return _buildLoading();
            } else if (state is DummyDataLoaded) {
              return _loaded(state);
            } else if (state is DummyDataError) {
              return _error(state);
            }
            return _noData();
          },
        ),
      ),
    );
  }

  Center _noData() => const Center(child: Text('Veri yok'));

  Center _error(DummyDataError state) =>
      Center(child: Text('Hata: ${state.message}'));

  ListView _loaded(DummyDataLoaded state) {
    return ListView.builder(
      itemCount: state.data.length,
      itemBuilder: (_, i) => ListTile(
        title: Text(state.data[i].title ?? ''),
        subtitle: Text(state.data[i].body ?? ''),
      ),
    );
  }

  Center _buildLoading() => const Center(child: CircularProgressIndicator());
}
