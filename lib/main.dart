import 'package:bloc_pattern_example/core/bloc/global_bloc.dart';
import 'package:bloc_pattern_example/data/repository/user_repo.dart';
import 'package:bloc_pattern_example/features/home_page/presentation/home_page.dart';
import 'package:bloc_pattern_example/routes/go_router_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routerConfig: goRouter,
    );
  }
}
