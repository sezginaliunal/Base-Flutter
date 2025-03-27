class AppUrls {
  factory AppUrls() {
    return _instance;
  }

  AppUrls._privateConstructor();

  static final AppUrls _instance = AppUrls._privateConstructor();

  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  String getTodos() => '$baseUrl/todos';
}
