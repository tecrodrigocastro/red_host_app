import 'package:red_host_app/src/app/features/auth/domain/repositories/auth_repository_interface.dart';
import 'package:red_host_app/src/core/entities/auth/user_entity.dart';
import 'package:red_host_app/src/core/typedefs/types.dart';
import 'package:red_host_app/src/core/usecase/usecase_interface.dart';

class LoginUsecase implements UseCase<UserEntity, LoginParams> {
  final AuthRepositoryInterface _authRepository;

  LoginUsecase({
    required AuthRepositoryInterface authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<Output<UserEntity>> call(LoginParams params) async {
    return _authRepository.login(
      email: params.email,
      password: params.password,
    );
  }
}

class LoginParams {
  final String email;
  final String password;

  LoginParams({required this.email, required this.password});
}
