import 'package:red_host_app/src/app/features/plans/data/models/plan_model.dart';

class InvoiceEntity {
  final String clientId;
  final double amount;
  final String status;
  final PlanModel plan;
  InvoiceEntity({
    required this.clientId,
    required this.amount,
    required this.status,
    required this.plan,
  });
}
