/// {@template nl_iruoy_tjas_v0_json}
/// Wordpress backend which serves https://tjas.nl
/// {@endtemplate}
library nl_iruoy_tjas_v0_json;

import 'dart:core' as _i2;

import 'package:equatable/equatable.dart' as _i1;

const PostStatusEnumMap = {
  PostStatus.publish: 'publish',
  PostStatus.future: 'future',
  PostStatus.draft: 'draft',
  PostStatus.pending: 'pending',
  PostStatus.private: 'private',
  PostStatus.trash: 'trash',
  PostStatus.autoDraft: 'auto-draft',
  PostStatus.inherit: 'inherit'
};

/// {@template post_status}
/// The publication status of a post
/// {@endtemplate}
enum PostStatus {
  publish,
  future,
  draft,
  pending,
  private,
  trash,
  autoDraft,
  inherit
}

/// {@template post}
/// A generic post of Wordpress
/// {@endtemplate}
class Post extends _i1.Equatable {
  /// {@macro post}
  const Post({
    required this.id,
    required this.date,
    required this.status,
    required this.link,
    required this.title,
    required this.excerpt,
  });

  factory Post.fromJson(_i2.dynamic json) {
    return Post(
      id: (json['id'] as _i2.int),
      date: _i2.DateTime.parse((json['date'] as _i2.String)),
      status: PostStatusEnumMap.entries
          .firstWhere((v0) => v0.value == (json['status'] as _i2.String))
          .key,
      link: (json['link'] as _i2.String),
      title: PostTitle.fromJson(json['title']),
      excerpt: PostExcerpt.fromJson(json['excerpt']),
    );
  }

  final _i2.int id;

  final _i2.DateTime date;

  final PostStatus status;

  final _i2.String link;

  final PostTitle title;

  final PostExcerpt excerpt;

  _i2.dynamic toJson() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'status': PostStatusEnumMap[status],
      'link': link,
      'title': title.toJson(),
      'excerpt': excerpt.toJson()
    };
  }

  Post copyWith({
    _i2.int? id,
    _i2.DateTime? date,
    PostStatus? status,
    _i2.String? link,
    PostTitle? title,
    PostExcerpt? excerpt,
  }) {
    return Post(
      id: id ?? this.id,
      date: date ?? this.date,
      status: status ?? this.status,
      link: link ?? this.link,
      title: title ?? this.title,
      excerpt: excerpt ?? this.excerpt,
    );
  }

  @_i2.override
  _i2.List<_i2.Object?> get props {
    return [id, date, status, link, title, excerpt];
  }
}

/// {@template post_excerpt}
/// The excerpt of a Wordpress post
/// {@endtemplate}
class PostExcerpt extends _i1.Equatable {
  /// {@macro post_excerpt}
  const PostExcerpt({required this.rendered});

  factory PostExcerpt.fromJson(_i2.dynamic json) {
    return PostExcerpt(rendered: (json['rendered'] as _i2.String));
  }

  final _i2.String rendered;

  _i2.dynamic toJson() {
    return {'rendered': rendered};
  }

  PostExcerpt copyWith({_i2.String? rendered}) {
    return PostExcerpt(rendered: rendered ?? this.rendered);
  }

  @_i2.override
  _i2.List<_i2.Object?> get props {
    return [rendered];
  }
}

/// {@template post_title}
/// The title of a Wordpress post
/// {@endtemplate}
class PostTitle extends _i1.Equatable {
  /// {@macro post_title}
  const PostTitle({required this.rendered});

  factory PostTitle.fromJson(_i2.dynamic json) {
    return PostTitle(rendered: (json['rendered'] as _i2.String));
  }

  final _i2.String rendered;

  _i2.dynamic toJson() {
    return {'rendered': rendered};
  }

  PostTitle copyWith({_i2.String? rendered}) {
    return PostTitle(rendered: rendered ?? this.rendered);
  }

  @_i2.override
  _i2.List<_i2.Object?> get props {
    return [rendered];
  }
}
