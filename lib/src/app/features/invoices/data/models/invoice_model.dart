import 'package:red_host_app/src/app/features/invoices/domain/entities/invoice_entity.dart';
import 'package:red_host_app/src/app/features/plans/data/models/plan_model.dart';

class InvoiceModel extends InvoiceEntity {
  InvoiceModel({
    required super.clientId,
    required super.amount,
    required super.status,
    required super.plan,
  });

  factory InvoiceModel.fromJson(Map<String, dynamic> json) {
    return InvoiceModel(
      clientId: json['client_id'],
      amount: json['amount'],
      status: json['status'],
      plan: PlanModel.fromJson(json['plan']),
    );
  }
}
