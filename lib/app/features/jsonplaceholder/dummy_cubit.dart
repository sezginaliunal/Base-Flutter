import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/app/features/jsonplaceholder/dummy_repository.dart';
import 'package:test_project/app/features/jsonplaceholder/dummy_state.dart';
import 'package:test_project/core/utils/dialogs.dart';

class DummyCubit extends Cubit<DummyState> {
  DummyCubit(this._repository) : super(DummyInitial());
  final DummyRepository _repository;

  Future<void> fetchData() async {
    emit(DummyDataLoading());
    final result = await _repository.fetchDummyData();

    if (result.success && result.data != null) {
      emit(DummyDataLoaded(result.data!));
    } else {
      emit(DummyDataError(result.message ?? 'Bilinmeyen hata'));
      AppUI.showSnack(result.message ?? 'Bilinmeyen hata');
    }
  }
}
