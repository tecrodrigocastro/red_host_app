import 'package:red_host_app/src/core/entities/auth/credencial_entity.dart';

class CredencialModel extends CredencialEntity {
  CredencialModel({required super.email, required super.password});

  factory CredencialModel.fromJson(Map<String, dynamic> json) {
    return CredencialModel(
      email: json['email'],
      password: json['password'],
    );
  }
  @override
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
