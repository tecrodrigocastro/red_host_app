import 'package:red_host_app/src/app/features/plans/domain/entities/plan_entity.dart';
import 'package:red_host_app/src/app/features/plans/domain/repositories/plan_repository_interface.dart';
import 'package:red_host_app/src/core/typedefs/types.dart';
import 'package:red_host_app/src/core/usecase/usecase_interface.dart';

class GetPlansUsecase implements UseCase<List<PlanEntity>, NoParams> {
  final PlanRepositoryInterface _repository;

  GetPlansUsecase({
    required PlanRepositoryInterface repository,
  }) : _repository = repository;

  @override
  Future<Output<List<PlanEntity>>> call(NoParams params) async {
    return await _repository.getPlans();
  }
}
