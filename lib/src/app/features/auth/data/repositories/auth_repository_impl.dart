import 'package:fpdart/fpdart.dart';
import 'package:red_host_app/src/app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:red_host_app/src/app/features/auth/data/models/user_model.dart';
import 'package:red_host_app/src/app/features/auth/domain/repositories/auth_repository_interface.dart';
import 'package:red_host_app/src/core/client_http/app_response.dart';
import 'package:red_host_app/src/core/client_http/client_http.dart';
import 'package:red_host_app/src/core/entities/auth/user_entity.dart';
import 'package:red_host_app/src/core/errors/errors.dart';
import 'package:red_host_app/src/core/typedefs/types.dart';

class AuthRepositoryImpl implements AuthRepositoryInterface {
  final AuthRemoteDatasource _authRemoteDatasource;

  AuthRepositoryImpl({required AuthRemoteDatasource authRemoteDatasource})
      : _authRemoteDatasource = authRemoteDatasource;
  @override
  Future<Output<UserEntity>> login(
      {required String email, required String password}) async {
    try {
      final response = await _authRemoteDatasource.post(
        RestClientRequest(
          path: '/api/login',
          data: {
            'email': email,
            'password': password,
          },
        ),
      );

      if (response.statusCode == 200) {
        final user = AppResponse<UserEntity>.fromJson(
            response.data, (dynamic json) => UserModel.fromJson(json));
        return Right(user);
      }
      return Left(DefaultException(message: response.data['message']));
    } catch (e) {
      return Left(
        DefaultException(message: 'Erro ao realizar login $e'),
      );
    }
  }

  @override
  Future<Output<UserEntity>> register({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    try {
      final response = await _authRemoteDatasource.post(
        RestClientRequest(
          path: '/api/register',
          data: {
            'email': email,
            'password': password,
            'name': name,
            'phone': phone,
          },
        ),
      );

      if (response.statusCode == 201) {
        final user = AppResponse<UserEntity>.fromJson(
            response.data, (dynamic json) => UserModel.fromJson(json));
        return Right(user);
      }

      return Left(DefaultException(message: response.data['message']));
    } catch (e) {
      return const Left(
        DefaultException(message: 'Erro ao realizar cadastro'),
      );
    }
  }
}
