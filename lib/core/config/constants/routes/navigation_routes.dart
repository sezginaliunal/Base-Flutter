enum RoutesName {
  init('/'),
  unknown('/unknown'),
  onboarding('/onboarding'),
  home('/home'),
  printer('/printer'),
  companySettings('/companySettings'),
  login('/login'),
  settings('/settings'),
  profile('/profile');

  final String path;
  const RoutesName(this.path);
}
