enum RoutesName {
  init('/'),
  dummy('/dummy'),
  home('/home'),
  settings('/settings'),
  profile('/profile');

  final String path;
  const RoutesName(this.path);
}
