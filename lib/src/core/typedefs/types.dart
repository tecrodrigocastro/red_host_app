import 'package:fpdart/fpdart.dart';
import 'package:red_host_app/src/core/errors/base_exception.dart';

typedef Output<T> = Either<BaseException, T>;
