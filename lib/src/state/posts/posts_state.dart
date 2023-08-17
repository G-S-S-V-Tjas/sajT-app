part of 'posts_bloc.dart';

sealed class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

final class PostsLoading extends PostsState {
  const PostsLoading();
}

final class PostsSuccess extends PostsState {
  final List<i2.Post> posts;

  const PostsSuccess({
    required this.posts,
  });
}

final class PostsFailure extends PostsState {
  final i1.ClientErrorResponse error;

  const PostsFailure({
    required this.error,
  });
}
