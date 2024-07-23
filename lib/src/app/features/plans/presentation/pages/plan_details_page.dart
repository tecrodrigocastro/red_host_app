import 'package:flutter/material.dart';
import 'package:red_host_app/src/core/entities/plan/plan_entity.dart';

class PlanDetailsPage extends StatelessWidget {
  const PlanDetailsPage({super.key, required this.plan});

  final PlanEntity plan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(plan.name),
      ),
    );
  }
}
