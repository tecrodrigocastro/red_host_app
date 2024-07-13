import 'dart:async';

import 'package:red_host_app/src/core/client_http/rest_client_exception.dart';
import 'package:red_host_app/src/core/client_http/rest_client_http_message.dart';
import 'package:red_host_app/src/core/client_http/rest_client_request.dart';
import 'package:red_host_app/src/core/client_http/rest_client_response.dart';

abstract interface class IClientInterceptor {
  FutureOr<RestClientHttpMessage> onResponse(RestClientResponse response);
  FutureOr<RestClientHttpMessage> onRequest(RestClientRequest request);
  FutureOr<RestClientHttpMessage> onError(RestClientException error);
}
