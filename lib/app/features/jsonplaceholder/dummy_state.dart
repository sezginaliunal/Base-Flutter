import 'package:flutter/foundation.dart';
import 'package:test_project/app/features/jsonplaceholder/dummy_model.dart';

abstract class DummyState {}

class DummyInitial extends DummyState {}

class DummyDataLoading extends DummyState {}

class DummyDataLoaded extends DummyState {
  final List<DummyData> data;

  DummyDataLoaded(this.data);
  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is DummyDataLoaded && listEquals(o.data, data);
  }

  @override
  int get hashCode => data.hashCode;
}

class DummyDataError extends DummyState {
  final String message;

  DummyDataError(this.message);
}
