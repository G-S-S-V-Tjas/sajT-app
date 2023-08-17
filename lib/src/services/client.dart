import 'package:http/http.dart';
import 'package:tjas/src/generated/nl_iruoy_tjas_v0_client.dart' as i1;

final client = i1.Client(
  baseUrl: 'https://tjas.nl/wp-json/wp/v2',
  client: Client(),
);
