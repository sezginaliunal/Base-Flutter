import 'package:equatable/equatable.dart';

abstract class InitState extends Equatable {
  const InitState();

  @override
  List<Object?> get props => [];
}

/// Başlangıç (ilk) durum
class InitInitialState extends InitState {
  const InitInitialState();
}

/// Yükleniyor durumu
class InitLoadingState extends InitState {
  const InitLoadingState();
}

/// Veri yüklendi durumu
class InitLoadedState extends InitState {
  final List<String> items;
  final bool isDescending;

  const InitLoadedState({required this.items, this.isDescending = false});

  InitLoadedState copyWith({List<String>? items, bool? isDescending}) {
    return InitLoadedState(
      items: items ?? this.items,
      isDescending: isDescending ?? this.isDescending,
    );
  }

  @override
  List<Object?> get props => [items, isDescending];
}

/// Hata durumu
class InitErrorState extends InitState {
  final String message;
  const InitErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
