import 'package:red_host_app/src/app/features/plans/domain/entities/plan_entity.dart';
import 'package:red_host_app/src/core/typedefs/types.dart';

abstract interface class PlanRepositoryInterface {
  Future<Output<List<PlanEntity>>> getPlans();
}
