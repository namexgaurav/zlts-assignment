import 'package:zlts_assignment/features/show_posts/domain/entities/post_entity.dart';
import 'package:zlts_assignment/features/show_posts/domain/repositires/post_repositires.dart';

class PostsUsecase {
  final PostRepositires repository;

  PostsUsecase({required this.repository});

  Future<List<PostsEntity>> callRepoFunc() {
    return repository.getPosts();
  }
}
