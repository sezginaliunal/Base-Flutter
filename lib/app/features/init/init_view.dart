import 'package:clara/extensions/context_extension.dart';
import 'package:clara/extensions/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/app/features/init/init_controller.dart';
import 'package:test_project/core/theme/theme_controller.dart';
import 'package:test_project/core/widgets/layout/generic_grid_view.dart';
import 'package:test_project/core/widgets/layout/generic_list_view.dart';

class InitPage extends GetView<InitController> {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: controller.toggle),
      appBar: AppBar(title: Text("Generic List with State")),
      body: Obx(
        () => controller.isList.isTrue
            ? GenericListView(
                data: controller.items,
                state: controller.state,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(
                        controller.items[index],
                        style: context.textStyles.labelLarge,
                      ),
                      Text(controller.items[index]),
                    ],
                  ).wrapInCard();
                },
              )
            : GenericGridView<InitController>(
                data: controller.items,
                state: controller.state,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(
                        controller.items[index],
                        style: context.textStyles.labelLarge,
                      ).expanded,
                      Text(controller.items[index]).expanded,
                    ],
                  ).wrapInCard();
                },
                emptyMessage: "Liste boş",
                errorMessage: "Veri alınamadı",
                onRetry: () => controller.loadData(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
              ),
      ),
    );
  }
}
