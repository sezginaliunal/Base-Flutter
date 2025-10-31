import 'package:flutter_bloc/flutter_bloc.dart';
import 'init_state.dart';

class InitCubit extends Cubit<InitState> {
  InitCubit() : super(const InitInitialState());

  /// Veri yükleme işlemi
  Future<void> loadData() async {
    emit(const InitLoadingState());
    try {
      final items = ['Elma', 'Armut', 'Kiraz', 'Üzüm'];
      emit(InitLoadedState(items: items, isDescending: false));
    } catch (e) {
      emit(InitErrorState(e.toString()));
    }
  }

  /// Listeyi sıralama işlemi
  Future<void> sortItems() async {
    final currentState = state;
    if (currentState is InitLoadedState) {
      emit(const InitLoadingState());

      final newIsDescending = !currentState.isDescending;
      final sorted = List<String>.from(currentState.items)
        ..sort((a, b) => newIsDescending ? b.compareTo(a) : a.compareTo(b));

      emit(currentState.copyWith(items: sorted, isDescending: newIsDescending));
    }
  }
}
