import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_project/core/utils/logger.dart';

abstract class ICacheManager<T> {
  ICacheManager(this.key);
  final String key;
  Box<T>? box;

  // Asenkron init fonksiyonu
  Future<void> init() async {
    registerAdapters();
    if (box == null || !(box?.isOpen ?? false)) {
      box = await Hive.openBox<T>(key);
    }
    Logger.log(LogLevel.info, '$box is ${box?.isOpen}');
  }

  // Adaptör kayıt işlemi
  void registerAdapters();

  // Veritabanını temizle
  Future<void> clearAll() async {
    await box?.clear();
  }

  // Listeyi kaydet
  Future<void> putItems(List<T> items) async {
    for (final item in items) {
      await putItem(item); // Her bir item'ı tek tek kaydediyoruz
    }
  }

  // Tek bir item al
  T? getItem(String key);

  // Değerlerin listesini al
  Future<List<T>?> getValues();

  // Tek bir item kaydet
  Future<void> putItem(T item);

  // Item sil
  Future<void> removeItem(String key);
}

// class UserCacheManager extends ICacheManager<User> {
//   UserCacheManager(super.key);

//   @override
//   Future<void> addItems(List<User> items) async {
//     await box?.addAll(items);
//   }

//   @override
//   Future<void> putItems(List<User> items) async {
//     await box?.putAll(Map.fromEntries(items.map((e) => MapEntry(e.id, e))));
//   }

//   @override
//   User? getItem(String key) {
//     return box?.get(key);
//   }

//   @override
//   Future<void> putItem(String key, User item) async {
//     await box?.put(key, item);
//   }

//   @override
//   Future<void> removeItem(String key) async {
//     await box?.delete(key);
//   }

//   @override
//   Future<List<User>?> getValues() async {
//     return box?.values.toList();
//   }

//   @override
//   void registerAdapters() {
//     if (!Hive.isAdapterRegistered(HiveConstants.userTypeId)) {
//       Hive.registerAdapter(UserAdapter());
//     }
//   }
// }
