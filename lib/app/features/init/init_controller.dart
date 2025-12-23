import 'package:get/get.dart';
import 'package:test_project/core/widgets/layout/generic_list_view.dart';
import 'package:test_project/core/widgets/layout/state_enum.dart';

class InitController extends GetxController {
  var items = <String>[].obs;
  var state = ViewState.loading.obs;
  RxBool isList = false.obs;

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  void toggle() {
    isList.value = !isList.value;
  }

  void loadData() async {
    state.value = ViewState.loading;
    try {
      await Future.delayed(Duration(seconds: 2));

      // Örnek: veri boş ise empty state
      items.addAll([
        'Item 1',
        'Item 2',
        'Item 3',
        'Item 1',
        'Item 2',
        'Item 3'
            'Item 1',
        'Item 2',
        'Item 3'
            'Item 1',
        'Item 2',
        'Item 3'
            'Item 1',
        'Item 2',
        'Item 3'
            'Item 1',
        'Item 2',
        'Item 3'
            'Item 1',
        'Item 2',
        'Item 3'
            'Item 1',
        'Item 2',
        'Item 3'
            'Item 1',
        'Item 2',
        'Item 3'
            'Item 1',
        'Item 2',
        'Item 3'
            'Item 1',
        'Item 2',
        'Item 3'
            'Item 1',
        'Item 2',
        'Item 3'
            'Item 1',
        'Item 2',
        'Item 3'
            'Item 1',
        'Item 2',
        'Item 3'
            'Item 1',
        'Item 2',
        'Item 3'
            'Item 1',
        'Item 2',
        'Item 3'
            'Item 1',
        'Item 2',
        'Item 3'
            'Item 1',
        'Item 2',
        'Item 3'
            'Item 1',
        'Item 2',
        'Item 3'
            'Item 1',
        'Item 2',
        'Item 3'
            'Item 1',
        'Item 2',
        'Item 3'
            'Item 1',
        'Item 2',
        'Item 3'
            'Item 1',
        'Item 2',
        'Item 3'
            'Item 1',
        'Item 2',
        'Item 3'
            'Item 1',
        'Item 2',
        'Item 3'
            'Item 1',
        'Item 2',
        'Item 3'
            'Item 1',
        'Item 2',
        'Item 3'
            'Item 1',
        'Item 2',
        'Item 3'
            'Item 1',
        'Item 2',
        'Item 3'
            'Item 1',
        'Item 2',
        'Item 3'
            'Item 1',
        'Item 2',
        'Item 3'
            'Item 1',
        'Item 2',
        'Item 3'
            'Item 1',
        'Item 2',
        'Item 3'
            'Item 1',
        'Item 2',
        'Item 3'
            'Item 1',
        'Item 2',
        'Item 3'
            'Item 1',
        'Item 2',
        'Item 3'
            'Item 1',
        'Item 2',
        'Item 3'
            'Item 1',
        'Item 2',
        'Item 3'
            'Item 1',
        'Item 2',
        'Item 3'
            'Item 1',
        'Item 2',
        'Item 3'
            'Item 1',
        'Item 2',
        'Item 3'
            'Item 1',
        'Item 2',
        'Item 3'
            'Item 1',
        'Item 2',
        'Item 3'
            'Item 1',
        'Item 2',
        'Item 3',
      ]);

      if (items.isEmpty) {
        state.value = ViewState.empty;
      } else {
        state.value = ViewState.success;
      }
    } catch (e) {
      state.value = ViewState.error;
    }
  }
}
