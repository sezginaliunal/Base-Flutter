import 'package:test_project/core/config/constants/app/app_infos.dart';

enum AppIconAssets {
  home('home_icon.png'),
  profile('profile_icon.png'),
  settings('settings_icon.png');

  const AppIconAssets(this.fileName);

  final String fileName;

  String get path => '${AppInfos.iconsBase}$fileName';
}
