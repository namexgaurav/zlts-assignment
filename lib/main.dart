import 'package:flutter/material.dart';
import 'package:zlts_assignment/core/routes/app_route.dart';
import 'package:zlts_assignment/init_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Assignment',
      debugShowCheckedModeBanner: false,
      routerConfig: appRoute,
    );
  }
}
