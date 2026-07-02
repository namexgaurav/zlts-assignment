import 'package:go_router/go_router.dart';
import 'package:zlts_assignment/features/show_posts/presentation/pages/show_posts.dart';

final GoRouter appRoute = GoRouter(
  initialLocation: "/",
  routes: [GoRoute(path: "/", builder: (context, state) => const ShowPosts())],
);
