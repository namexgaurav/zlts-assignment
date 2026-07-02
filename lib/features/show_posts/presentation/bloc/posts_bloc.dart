import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zlts_assignment/core/error/exceptions.dart';
import 'package:zlts_assignment/features/show_posts/domain/entities/post_entity.dart';
import 'package:zlts_assignment/features/show_posts/domain/usecase/posts_usecase.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostsUsecase postsUsecase;
  PostsBloc(this.postsUsecase) : super(PostsInitial()) {
    on<FetchPostEvent>(_onFetchPosts);
  }

  Future<void> _onFetchPosts(
    FetchPostEvent event,
    Emitter<PostsState> emit,
  ) async {
    emit(PostsLoading());
    try {
      final posts = await postsUsecase.callRepoFunc();
      emit(PostsLoaded(posts: posts));
    } on ServerException catch (e) {
      emit(PostsError(e.message));
    } catch (e) {
      emit(PostsError('Unexpected error: $e'));
    }
  }
}
