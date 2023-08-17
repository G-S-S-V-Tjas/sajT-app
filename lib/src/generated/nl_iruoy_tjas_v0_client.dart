/// {@template nl_iruoy_tjas_v0_client}
/// Wordpress backend which serves https://tjas.nl
/// {@endtemplate}
library nl_iruoy_tjas_v0_client;

import 'dart:convert' as _i4;
import 'dart:core' as _i2;

import 'package:http/http.dart' as _i1;

import './nl_iruoy_tjas_v0_json.dart' as _i3;

class PostResource {
  const PostResource({
    required this.client,
    required this.baseUrl,
  });

  final _i1.Client client;

  final _i2.String baseUrl;

  /// Events which all members of Tjas can join
  _i2.Future<_i2.List<_i3.Post>> get() async {
    final uri = _i2.Uri.parse('$baseUrl/tribe_events');

    final response = await client.get(uri);

    switch (response.statusCode) {
      case 200:
        final json = _i4.jsonDecode(response.body);

        return (json as _i2.List).map((v0) => _i3.Post.fromJson(v0)).toList();

      default:
        throw ClientErrorResponse(
          status: response.statusCode,
          body: response.body,
        );
    }
  }
}

class Client {
  const Client({
    required this.client,
    required this.baseUrl,
  });

  final _i1.Client client;

  final _i2.String baseUrl;

  PostResource get posts {
    return PostResource(
      client: client,
      baseUrl: baseUrl,
    );
  }
}

class ClientErrorResponse implements _i2.Exception {
  const ClientErrorResponse({
    required this.status,
    required this.body,
  });

  final _i2.int status;

  final _i2.dynamic body;
}
