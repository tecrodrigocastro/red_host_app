import 'package:red_host_app/src/core/entities/auth/user_entity.dart';
import 'package:red_host_app/src/core/typedefs/types.dart';

abstract interface class AuthRepositoryInterface {
  Future<Output<UserEntity>> login(
      {required String email, required String password});
}