import 'package:clara/extensions/context_extension.dart';
import 'package:clara/extensions/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/app/features/theme/cubit/theme_cubit.dart';
import 'package:test_project/core/config/constants/assets/app_font_styles.dart';
import 'package:test_project/core/config/constants/colors/app_colors.dart';

class InitPage extends StatelessWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListTile(
            trailing: Switch(value: true, onChanged: (val) {}),
            title: Text(
              'data',
              style: context.textStyles.displayLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ).wrapInCard(),
          // Widget içinde kullanım
          Container(
            child: Text(
              'data',
              style: AppFontStyles.sfProDisplay.regular.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // TextField
          TextField(decoration: InputDecoration()),

          // Icon
          Icon(Icons.home, color: AppColors.iconPrimary(context)),

          // Divider
          Divider(color: AppColors.divider(context)),
          // Button
          ElevatedButton(
            onPressed: () => context.read<ThemeCubit>().toggleTheme(),
            child: Text('Button'),
          ),
          Card(child: Text('data').paddingLow()),
        ],
      ),
    );
  }
}
