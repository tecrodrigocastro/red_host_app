import 'package:red_host_app/src/core/client_http/rest_client_http_message.dart';
import 'package:red_host_app/src/core/client_http/rest_client_response.dart';
import 'package:red_host_app/src/core/errors/errors.dart';

class RestClientException extends BaseException
    implements RestClientHttpMessage {
  dynamic error;
  RestClientResponse? response;

  RestClientException({
    required super.message,
    super.statusCode,
    super.data,
    required this.error,
    this.response,
    super.stackTracing,
  });
}
