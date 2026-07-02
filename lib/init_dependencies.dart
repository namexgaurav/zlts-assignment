import 'package:get_it/get_it.dart';
import 'package:zlts_assignment/core/network/dio_client.dart';
import 'package:zlts_assignment/features/show_posts/data/datasource/posts_api_service.dart';
import 'package:zlts_assignment/features/show_posts/data/repository/posts_repository_imple.dart';
import 'package:zlts_assignment/features/show_posts/domain/repositires/post_repositires.dart';
import 'package:zlts_assignment/features/show_posts/domain/usecase/posts_usecase.dart';
import 'package:zlts_assignment/features/show_posts/presentation/bloc/posts_bloc.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  getIt.registerLazySingleton(() => DioClient.createDio());

  getIt.registerLazySingleton<PostsApiService>(() => PostsApiService(getIt()));

  getIt.registerLazySingleton<PostRepositires>(
    () => PostsRepositoryImple(apiService: getIt()),
  );
  getIt.registerLazySingleton(() => PostsUsecase(repository: getIt()));

  getIt.registerFactory(() => PostsBloc(getIt()));
}
