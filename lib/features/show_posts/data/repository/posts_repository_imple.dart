import 'package:dio/dio.dart';
import 'package:zlts_assignment/core/error/exceptions.dart';
import 'package:zlts_assignment/features/show_posts/data/datasource/posts_api_service.dart';
import 'package:zlts_assignment/features/show_posts/domain/entities/post_entity.dart';
import 'package:zlts_assignment/features/show_posts/domain/repositires/post_repositires.dart';

class PostsRepositoryImple implements PostRepositires {
  final PostsApiService apiService;

  PostsRepositoryImple({required this.apiService});

  @override
  Future<List<PostsEntity>> getPosts() async {
    try {
      final models = await apiService.getPosts();
      return models.map((m) => m.toEntity()).toList();
    } on DioException catch (e) {
      throw ServerException(e.message ?? 'Something went wrong');
    }
  }
}
