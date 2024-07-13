abstract class CredencialEntity {
  final String email;
  final String password;

  CredencialEntity({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson();
}
