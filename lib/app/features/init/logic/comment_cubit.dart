import 'package:test_project/core/cubit/base_cubit.dart';
import 'package:test_project/app/features/init/data/models/comment_response.dart';
import 'package:test_project/app/features/init/data/datasources/comment_api_service.dart';

class CommentCubit extends BaseCubit<Comment> {
  final CommentApiService _service;

  CommentCubit(this._service);

  // Tüm yorumlar
  Future<void> fetchComments() async {
    try {
      setLoading();
      final response = await _service.getComments();
      if (response.success) {
        setSuccessList(response.data!);
      } else {
        setError(response.message);
      }
    } catch (e) {
      setError(e.toString());
    }
  }

  // Tek yorum
  // Future<void> fetchComment(int id) async {
  //   try {
  //     setLoading();
  //     final response = await _service.getComment(id);
  //     if (response.isSuccessful) {
  //       setSuccessItem(response.data!);
  //     } else {
  //       setError(response.message ?? "Bir hata oluştu");
  //     }
  //   } catch (e) {
  //     setError(e.toString());
  //   }
  // }
}
