import 'package:zlts_assignment/features/show_posts/domain/entities/post_entity.dart';

abstract class PostRepositires {
  Future<List<PostsEntity>> getPosts();
}
