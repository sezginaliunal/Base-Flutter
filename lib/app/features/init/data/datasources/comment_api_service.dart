import 'package:test_project/core/config/constants/app/app_urls.dart';
import 'package:test_project/core/config/di/service_locator.dart';
import 'package:test_project/core/models/api_response.dart';
import 'package:test_project/core/services/api/base_network.dart';
import 'package:test_project/app/features/init/data/models/comment_response.dart';

class CommentApiService {
  final _network = sl<BaseNetwork>();

  Future<ApiResponse<List<Comment>>> getComments() async {
    return await _network.get<List<Comment>>(
      AppUrls.comments.path,
      fromJsonT: (json) {
        if (json is List) {
          return json
              .map((e) => Comment.fromJson(e as Map<String, dynamic>))
              .toList();
        }
        return [];
      },
    );
  }
}
