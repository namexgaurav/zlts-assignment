import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zlts_assignment/features/show_posts/presentation/bloc/posts_bloc.dart';
import 'package:zlts_assignment/init_dependencies.dart';

class ShowPosts extends StatelessWidget {
  const ShowPosts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PostsBloc>()..add(FetchPostEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text("ZLTS ASSIGNMENT"),
          actions: [
            IconButton(
              onPressed: () => context.read<PostsBloc>().add(FetchPostEvent()),
              icon: Icon(Icons.replay),
            ),
          ],
        ),
        body: BlocBuilder<PostsBloc, PostsState>(
          builder: (context, state) {
            if (state is PostsLoading || state is PostsInitial) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is PostsError) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Error: ${state.message}'),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () =>
                          context.read<PostsBloc>().add(FetchPostEvent()),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            }

            if (state is PostsLoaded) {
              final posts = state.posts;
              return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 6.0,
                      horizontal: 16.0,
                    ),
                    child: Card(
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              post.title,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              post.body,
                              style: TextStyle(
                                color: Colors.black38,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
