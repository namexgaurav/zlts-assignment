import 'package:json_annotation/json_annotation.dart';
import 'package:zlts_assignment/features/show_posts/domain/entities/post_entity.dart';

part 'posts_model.g.dart';

@JsonSerializable()
class PostsModel {
  final int userId;
  final int id;
  final String title;
  final String body;

  const PostsModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostsModel.fromJson(Map<String, dynamic> json) =>
      _$PostsModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostsModelToJson(this);

  PostsEntity toEntity() {
    return PostsEntity(id: id, userId: userId, title: title, body: body);
  }
}
