import 'package:red_host_app/src/core/client_http/rest_client_http_message.dart';

class RestClientRequest implements RestClientHttpMessage {
  final String path;
  final dynamic data;
  final String method;
  final String baseUrl;
  final Map<String, dynamic>? queryParameters;
  final Map<String, dynamic>? headers;

  RestClientRequest({
    required this.path,
    this.data,
    this.queryParameters,
    this.headers,
    this.method = 'GET',
    this.baseUrl = '',
  });

  RestClientRequest copyWith({
    String? path,
    dynamic data,
    String? method,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) {
    return RestClientRequest(
      path: path ?? this.path,
      data: data ?? this.data,
      method: method ?? this.method,
      queryParameters: queryParameters ?? this.queryParameters,
      headers: headers ?? this.headers,
    );
  }
}
