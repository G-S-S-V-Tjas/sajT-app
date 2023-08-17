/// {@template nl_iruoy_common_v0_json}
/// Shared models between multiple applications.
/// {@endtemplate}
library nl_iruoy_common_v0_json;

import 'dart:core' as _i2;

import 'package:equatable/equatable.dart' as _i1;

/// {@template error}
/// A generic error message.
/// {@endtemplate}
class Error extends _i1.Equatable {
  /// {@macro error}
  const Error({
    required this.code,
    required this.message,
  });

  factory Error.fromJson(_i2.dynamic json) {
    return Error(
      code: (json['code'] as _i2.String),
      message: (json['message'] as _i2.String),
    );
  }

  final _i2.String code;

  final _i2.String message;

  _i2.dynamic toJson() {
    return {'code': code, 'message': message};
  }

  Error copyWith({
    _i2.String? code,
    _i2.String? message,
  }) {
    return Error(
      code: code ?? this.code,
      message: message ?? this.message,
    );
  }

  @_i2.override
  _i2.List<_i2.Object?> get props {
    return [code, message];
  }
}

/// {@template healthcheck}
/// Wraps the status and version of a service.
/// {@endtemplate}
class Healthcheck extends _i1.Equatable {
  /// {@macro healthcheck}
  const Healthcheck({
    required this.status,
    required this.version,
  });

  factory Healthcheck.fromJson(_i2.dynamic json) {
    return Healthcheck(
      status: (json['status'] as _i2.String),
      version: (json['version'] as _i2.String),
    );
  }

  final _i2.String status;

  final _i2.String version;

  _i2.dynamic toJson() {
    return {'status': status, 'version': version};
  }

  Healthcheck copyWith({
    _i2.String? status,
    _i2.String? version,
  }) {
    return Healthcheck(
      status: status ?? this.status,
      version: version ?? this.version,
    );
  }

  @_i2.override
  _i2.List<_i2.Object?> get props {
    return [status, version];
  }
}
