import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/core/widgets/layout/state_enum.dart';
import 'package:test_project/core/widgets/views/error_view.dart';
import 'package:test_project/core/widgets/views/not_found_view.dart';

/// Generic UI Component
class GenericListView<T extends GetxController> extends GetView<T> {
  /// Data listesi
  final RxList<dynamic> data;

  /// State
  final Rx<ViewState> state;

  /// Data varken gösterilecek widget üretici
  final Widget Function(BuildContext context, int index) itemBuilder;

  /// Boş veri mesajı
  final String emptyMessage;

  /// Hata mesajı
  final String errorMessage;

  /// Yükleniyor göstergesi opsiyonel
  final Widget? loadingWidget;
  // Hata var ise tekrar etme butonu
  final void Function()? onRetry;
  const GenericListView({
    Key? key,
    required this.data,
    required this.state,
    required this.itemBuilder,
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
          return Center(child: loadingWidget ?? CircularProgressIndicator());
        case ViewState.error:
          return Center(
            child: ErrorView(message: errorMessage, onRetry: onRetry),
          );
        case ViewState.empty:
          return Center(child: NotFoundView(message: emptyMessage));
        case ViewState.success:
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: itemBuilder,
          );
      }
    });
  }
}
