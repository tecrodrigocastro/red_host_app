import 'package:red_host_app/src/core/client_http/client_http.dart';
import 'package:red_host_app/src/core/client_http/rest_client_multipart.dart';

class AuthRemoteDatasource implements IRestClient {
  final IRestClient _restClient;

  AuthRemoteDatasource({required IRestClient restClient})
      : _restClient = restClient;

  @override
  void addInterceptors(IClientInterceptor interceptor) async {
    return _restClient.addInterceptors(interceptor);
  }

  @override
  Future<RestClientResponse> delete(RestClientRequest request) async {
    return _restClient.delete(request);
  }

  @override
  Future<RestClientResponse> get(RestClientRequest request) async {
    return _restClient.get(request);
  }

  @override
  Future<RestClientResponse> patch(RestClientRequest request) async {
    return _restClient.patch(request);
  }

  @override
  Future<RestClientResponse> post(RestClientRequest request) async {
    return _restClient.post(request);
  }

  @override
  Future<RestClientResponse> put(RestClientRequest request) async {
    return _restClient.put(request);
  }

  @override
  void removeInterceptors(IClientInterceptor interceptor) async {
    return _restClient.removeInterceptors(interceptor);
  }

  @override
  Future<RestClientResponse> upload(RestClientMultipart multipart) async {
    return _restClient.upload(multipart);
  }
}
