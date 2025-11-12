enum BaseUrls {
  jsonPlaceholder('https://jsonplaceholder.typicode.com/'),
  myApi('http://91.99.198.71:8000/api/');

  final String url;
  const BaseUrls(this.url);
}

enum AppUrls {
  todos('todos', BaseUrls.jsonPlaceholder),
  comments('comments', BaseUrls.jsonPlaceholder),
  users('users', BaseUrls.jsonPlaceholder),
  login('auth/login', BaseUrls.myApi);

  final String path;
  final BaseUrls base;

  const AppUrls(this.path, this.base);

  String get url => '${base.url}$path';
  String get baseUrl => base.url;
}
