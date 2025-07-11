import 'package:test/test.dart';
import 'package:test_project/core/config/constants/app/app_urls.dart';
import 'package:test_project/core/models/login_request.dart';
import 'package:test_project/core/models/login_response.dart';
import 'package:test_project/core/services/api/base_network.dart';
import 'package:test_project/core/models/json_place_holder.dart';

void main() {
  final baseNetwork = BaseNetwork();

  test('GET todos - JSONPlaceholder with id', () async {
    // Eğer id /1 olarak path'te olmalıysa URL'yi enum içinde veya burada manuel yapabilirsin

    final response = await baseNetwork.get<JsonPlaceHolder>(
      AppUrls.todos.url + '/1',
      fromJsonT:
          (json) => JsonPlaceHolder.fromJson(json as Map<String, dynamic>),
      isApiResponse: false,
      baseUrl: BaseUrls.jsonPlaceholder.url,
    );

    print('Response data: ${response.data?.title}');
    expect(response.success, isTrue);
  });

  test('Gerçek POST isteği - Login', () async {
    final response = await baseNetwork.post<LoginResponse>(
      AppUrls.login.url,
      data:
          LoginRequest(username: 'sezgin', password: '1557443a123A.').toJson(),
      fromJsonT: (json) => LoginResponse.fromJson(json as Map<String, dynamic>),
      isApiResponse: true,
    );

    print('POST cevabı: ${response.data?.accessToken}');
    expect(response.success, isTrue);
    expect(response.data, isA<LoginResponse>());
  });
}
