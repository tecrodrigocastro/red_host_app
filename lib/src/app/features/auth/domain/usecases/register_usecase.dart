import 'package:red_host_app/src/app/features/auth/domain/repositories/auth_repository_interface.dart';
import 'package:red_host_app/src/core/entities/auth/user_entity.dart';
import 'package:red_host_app/src/core/typedefs/types.dart';
import 'package:red_host_app/src/core/usecase/usecase_interface.dart';

class RegisterUsecase implements UseCase<UserEntity, RegisterParams> {
  final AuthRepositoryInterface _authRepository;

  RegisterUsecase({
    required AuthRepositoryInterface authRepository,
  }) : _authRepository = authRepository;
  @override
  Future<Output<UserEntity>> call(RegisterParams params) async {
    return await _authRepository.register(
      email: params.email,
      password: params.password,
      name: params.name,
      phone: params.phone,
    );
  }
}

class RegisterParams {
  final String email;
  final String password;
  final String name;
  final String phone;

  RegisterParams({
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
  });
}
