extension MapExtensions<K, V> on Map<K, V>? {
  // =================== Null / Empty Kontroller ===================
  bool get isNullOrEmpty => this == null || this!.isEmpty;
  bool get isNotNullOrEmpty => !isNullOrEmpty;

  int get lengthOrZero => this?.length ?? 0;

  Map<K, V> get safe => this ?? {};

  // =================== Key / Value ===================
  V? getOrNull(K key) => this?.containsKey(key) == true ? this![key] : null;

  bool containsKeySafe(K key) => this?.containsKey(key) == true;
  bool containsValueSafe(V value) => this?.containsValue(value) == true;

  // =================== Manipülasyon ===================
  Map<K, V> filter(bool Function(K key, V value) test) {
    if (this == null) return {};
    final map = <K, V>{};
    this!.forEach((key, value) {
      if (test(key, value)) map[key] = value;
    });
    return map;
  }

  Map<K, V> mapValues(V Function(V value) transform) {
    if (this == null) return {};
    final map = <K, V>{};
    this!.forEach((key, value) {
      map[key] = transform(value);
    });
    return map;
  }

  Map<K2, V2> mapEntries<K2, V2>(
    MapEntry<K2, V2> Function(K key, V value) transform,
  ) {
    if (this == null) return {};
    final map = <K2, V2>{};
    this!.forEach((key, value) {
      final entry = transform(key, value);
      map[entry.key] = entry.value;
    });
    return map;
  }
}
