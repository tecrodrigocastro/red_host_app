import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:red_host_app/src/app/features/auth/data/models/user_model.dart';
import 'package:red_host_app/src/app/features/auth/domain/usecases/login_usecase.dart';
import 'package:red_host_app/src/app/features/auth/domain/usecases/register_usecase.dart';
import 'package:red_host_app/src/core/entities/auth/user_entity.dart';
import 'package:red_host_app/src/core/enums/status_enum.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends HydratedBloc<AuthEvent, AuthState> {
  final LoginUsecase _loginUsecase;
  final RegisterUsecase _registerUsecase;
  AuthBloc({
    required LoginUsecase loginUsecase,
    required RegisterUsecase registerUsecase,
  })  : _loginUsecase = loginUsecase,
        _registerUsecase = registerUsecase,
        super(AuthState.initial) {
    on<LogoutEvent>((event, emit) {
      emit(state.copyWith(
        status: StateStatus.initial,
        user: null,
        authenticated: false,
      ));
    });

    on<LoginEvent>((event, emit) async {
      emit(state.copyWith(status: StateStatus.loading));

      final response = await _loginUsecase(
        LoginParams(
          email: event.email,
          password: event.password,
        ),
      );
      response.fold(
        (l) {
          emit(state.copyWith(status: StateStatus.error, error: l.message));
        },
        (r) {
          emit(state.copyWith(
            status: StateStatus.success,
            user: r.data,
            authenticated: true,
          ));
        },
      );
    });
    on<RegisterEvent>((event, emit) async {
      emit(state.copyWith(status: StateStatus.loading));

      final response = await _registerUsecase(
        RegisterParams(
          email: event.email,
          password: event.password,
          name: event.name,
          phone: event.phone,
        ),
      );

      response.fold(
        (l) {
          emit(state.copyWith(status: StateStatus.error, error: l.message));
        },
        (r) {
          emit(state.copyWith(
            status: StateStatus.success,
            user: r.data,
            authenticated: true,
          ));
        },
      );
    });
  }

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    return AuthState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    return state.toMap();
  }
}
