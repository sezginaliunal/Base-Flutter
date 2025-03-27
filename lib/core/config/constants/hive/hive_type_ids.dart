class HiveTypeIds {
  factory HiveTypeIds() {
    return _instance;
  }
  HiveTypeIds._privateConstructor();

  static final HiveTypeIds _instance = HiveTypeIds._privateConstructor();

  // Type IDs
  static const int jwtModelTypeId = 1;
  static const int initTypeId = 2;
}
