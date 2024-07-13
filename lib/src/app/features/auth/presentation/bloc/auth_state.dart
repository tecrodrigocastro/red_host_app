part of 'auth_bloc.dart';

class AuthState extends Equatable {
  const AuthState(
    this.user,
    this.error, {
    required this.status,
    required this.authenticated,
  });

  final StateStatus status;
  final UserEntity? user;
  final bool authenticated;
  final String? error;

  static AuthState initial = const AuthState(
    null,
    '',
    status: StateStatus.initial,
    authenticated: false,
  );

  @override
  List<Object?> get props => [status, user, authenticated, error];

  AuthState copyWith({
    StateStatus? status,
    UserEntity? user,
    bool? authenticated,
    String? error,
  }) {
    return AuthState(
      user ?? this.user,
      error ?? this.error,
      status: status ?? this.status,
      authenticated: authenticated ?? this.authenticated,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status.index,
      'user': user?.toJson(),
      'authenticated': authenticated,
      'error': error,
    };
  }

  factory AuthState.fromMap(Map<String, dynamic> map) {
    return AuthState(
      UserModel.fromJson(map['user']),
      map['error'] as String,
      status: StateStatus.values[map['status'] as int],
      authenticated: map['authenticated'] as bool,
    );
  }
}
