import 'package:fpdart/fpdart.dart';
import 'package:red_host_app/src/core/client_http/app_response.dart';
import 'package:red_host_app/src/core/errors/base_exception.dart';

typedef Output<T> = Either<BaseException, AppResponse<T>>;
