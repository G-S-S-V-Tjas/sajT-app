import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tjas/src/app.dart';
import 'package:tjas/src/state/posts/posts_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => PostsBloc() //
            ..add(const ListPosts()),
        ),
      ],
      child: const TjasApp(),
    ),
  );
}
