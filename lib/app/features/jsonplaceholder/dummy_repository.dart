import 'package:test_project/app/features/jsonplaceholder/dummy_model.dart';
import 'package:test_project/core/config/constants/app/app_urls.dart';
import 'package:test_project/core/models/api_response.dart';
import 'package:test_project/core/services/api/base_network.dart';

class DummyRepository {
  DummyRepository._internal();
  static final DummyRepository _instance = DummyRepository._internal();
  factory DummyRepository() => _instance;

  // --- Network instance ---
  final _baseNetwork = BaseNetwork();

  // --- Data Fetch metodu ---
  Future<ApiResponse<List<DummyData>>> fetchDummyData() async {
    final response = await _baseNetwork.get<List<DummyData>>(
      AppUrls.posts.path,
      fromJsonT: (data) {
        final list = data as List<dynamic>;
        return list
            .map((e) => DummyData.fromJson(e as Map<String, dynamic>))
            .toList();
      },
    );
    return response;
  }
}
