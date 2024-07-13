import 'package:red_host_app/src/core/client_http/rest_client_http_message.dart';
import 'package:red_host_app/src/core/client_http/rest_client_request.dart';

class RestClientResponse implements RestClientHttpMessage {
  dynamic data;
  int? statusCode;
  String? message;
  RestClientRequest request;

  RestClientResponse({
    this.data,
    this.statusCode,
    this.message,
    required this.request,
  });
}
