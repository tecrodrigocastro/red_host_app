import 'package:fpdart/fpdart.dart';
import 'package:red_host_app/src/app/features/plans/data/datasources/plans_remote_datasource.dart';
import 'package:red_host_app/src/app/features/plans/data/models/plan_model.dart';
import 'package:red_host_app/src/app/features/plans/domain/entities/plan_entity.dart';
import 'package:red_host_app/src/app/features/plans/domain/repositories/plan_repository_interface.dart';
import 'package:red_host_app/src/core/client_http/app_response.dart';
import 'package:red_host_app/src/core/client_http/client_http.dart';
import 'package:red_host_app/src/core/errors/errors.dart';
import 'package:red_host_app/src/core/typedefs/types.dart';

class PlanRepositoryImpl implements PlanRepositoryInterface {
  final PlansRemoteDatasource _remoteDatasource;

  PlanRepositoryImpl({
    required PlansRemoteDatasource remoteDatasource,
  }) : _remoteDatasource = remoteDatasource;

  @override
  Future<Output<List<PlanEntity>>> getPlans() async {
    try {
      final response = await _remoteDatasource.get(
        RestClientRequest(path: '/api/plans'),
      );

      if (response.statusCode == 200) {
        final plans = AppResponse<List<PlanEntity>>.fromJson(
          response.data,
          (dynamic json) => (json as List)
              .map((e) => PlanModel.fromJson(e as Map<String, dynamic>))
              .toList(),
        );
        return Right(plans);
      }
      return Left(
        DefaultException(message: response.data['message']),
      );
    } catch (e) {
      return Left(
        DefaultException(message: e.toString()),
      );
    }
  }
}
