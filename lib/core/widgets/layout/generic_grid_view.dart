import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/core/widgets/layout/state_enum.dart';
import 'package:test_project/core/widgets/views/error_view.dart';
import 'package:test_project/core/widgets/views/not_found_view.dart';

/// Generic GridView Component
class GenericGridView<T extends GetxController> extends GetView<T> {
  /// Data listesi
  final RxList<dynamic> data;

  /// State
  final Rx<ViewState> state;

  /// Grid item builder
  final Widget Function(BuildContext context, int index) itemBuilder;

  /// Grid delegate (zorunlu – esneklik için dışarıdan alıyoruz)
  final SliverGridDelegate gridDelegate;

  /// Padding
  final EdgeInsetsGeometry padding;

  /// Boş veri mesajı
  final String emptyMessage;

  /// Hata mesajı
  final String errorMessage;

  /// Yükleniyor widget
  final Widget? loadingWidget;

  /// Retry callback
  final VoidCallback? onRetry;

  const GenericGridView({
    Key? key,
    required this.data,
    required this.state,
    required this.itemBuilder,
    required this.gridDelegate,
    this.padding = const EdgeInsets.all(16),
    this.emptyMessage = "No Data",
    this.errorMessage = "Error occurred",
    this.loadingWidget,
    this.onRetry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (state.value) {
        case ViewState.loading:
          return Center(
            child: loadingWidget ?? const CircularProgressIndicator(),
          );

        case ViewState.error:
          return Center(
            child: ErrorView(message: errorMessage, onRetry: onRetry),
          );

        case ViewState.empty:
          return Center(child: NotFoundView(message: emptyMessage));

        case ViewState.success:
          return GridView.builder(
            padding: padding,
            itemCount: data.length,
            gridDelegate: gridDelegate,
            itemBuilder: itemBuilder,
          );
      }
    });
  }
}
