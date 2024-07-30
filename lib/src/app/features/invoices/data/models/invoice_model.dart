import 'dart:developer';

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
    try {
      return InvoiceModel(
        clientId: json['client_id'],
        amount: double.tryParse(json['amount'].toString()) ?? 0.0,
        status: json['status'],
        plan: PlanModel.fromJson(json['plan']),
      );
    } catch (e, s) {
      log(s.toString());
      throw Exception(
        'Erro ao converter json para InvoiceModel ${e.toString()}',
      );
    }
  }
}
