import 'package:equatable/equatable.dart';

abstract class BaseState<T> extends Equatable {
  const BaseState();

  @override
  List<Object?> get props => [];
}

class BaseInitial<T> extends BaseState<T> {}

class BaseLoading<T> extends BaseState<T> {}

class BaseSuccess<T> extends BaseState<T> {
  final T? singleItem;
  final List<T>? itemList;

  const BaseSuccess({this.singleItem, this.itemList});

  bool get hasList => itemList != null && itemList!.isNotEmpty;
  bool get hasItem => singleItem != null;

  @override
  List<Object?> get props => [singleItem ?? itemList ?? []];
}

class BaseError<T> extends BaseState<T> {
  final String message;
  const BaseError(this.message);

  @override
  List<Object?> get props => [message];
}
