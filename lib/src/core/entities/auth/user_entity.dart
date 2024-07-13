import 'package:equatable/equatable.dart';

abstract class UserEntity extends Equatable {
  final int id;
  final String name;
  final String email;
  final String? phone;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
  });

  @override
  List<Object?> get props => [id, name, email, phone];

  Map<String, dynamic> toJson();
}
