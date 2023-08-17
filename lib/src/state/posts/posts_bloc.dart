import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tjas/src/generated/nl_iruoy_tjas_v0_client.dart' as i1;
import 'package:tjas/src/generated/nl_iruoy_tjas_v0_json.dart' as i2;
import 'package:tjas/src/services/client.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(const PostsLoading()) {
    on<ListPosts>(_handleListPosts);
  }

  FutureOr<void> _handleListPosts(
    ListPosts event,
    Emitter<PostsState> emit,
  ) async {
    emit(const PostsLoading());

    try {
      final posts = await client.posts.get();

      emit(PostsSuccess(posts: posts));
    } //
    on i1.ClientErrorResponse catch (error) {
      emit(PostsFailure(error: error));
    }
  }
}
