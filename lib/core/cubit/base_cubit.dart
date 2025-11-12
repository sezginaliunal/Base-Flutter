import 'package:bloc/bloc.dart';
import 'package:test_project/core/config/constants/app/app_locale_keys.dart';
import 'base_state.dart';

class BaseCubit<T> extends Cubit<BaseState<T>> {
  BaseCubit() : super(BaseInitial<T>());

  void setLoading() => emit(BaseLoading<T>());

  // Tek item için
  void setSuccessItem(T item) => emit(BaseSuccess(singleItem: item));

  // Liste için
  void setSuccessList(List<T> items) => emit(BaseSuccess(itemList: items));

  void setError(String? message) {
    emit(BaseError<T>(message ?? AppLocaleKeys.errError));
  }
}
