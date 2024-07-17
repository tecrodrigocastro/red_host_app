import 'package:red_host_app/src/app/features/plans/domain/entities/plan_entity.dart';

class PlanModel extends PlanEntity {
  PlanModel({
    required super.id,
    required super.name,
    required super.description,
    required super.price,
    required super.diskSpace,
    required super.bandwidth,
    required super.emailAccounts,
  });

  factory PlanModel.fromJson(Map<String, dynamic> json) {
    try {
      return PlanModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        price: double.parse(json['price'].toString()),
        diskSpace: json['disk_space'],
        bandwidth: json['bandwidth'],
        emailAccounts: json['email_accounts'],
      );
    } catch (e) {
      throw Exception(
          'Erro ao converter json para PlanModel - ${e.toString()}');
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': super.id,
      'name': super.name,
      'description': super.description,
      'price': super.price,
      'disk_space': super.diskSpace,
      'bandwidth': super.bandwidth,
      'email_accounts': super.emailAccounts,
    };
  }
}
