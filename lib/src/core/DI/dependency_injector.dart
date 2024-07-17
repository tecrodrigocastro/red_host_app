import 'package:get_it/get_it.dart';
import 'package:red_host_app/src/app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:red_host_app/src/app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:red_host_app/src/app/features/auth/domain/usecases/login_usecase.dart';
import 'package:red_host_app/src/app/features/auth/domain/usecases/register_usecase.dart';
import 'package:red_host_app/src/app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:red_host_app/src/app/features/plans/data/datasources/plans_remote_datasource.dart';
import 'package:red_host_app/src/app/features/plans/data/repositories/plan_repository_impl.dart';
import 'package:red_host_app/src/app/features/plans/domain/usecases/get_plans_usecase.dart';
import 'package:red_host_app/src/app/features/plans/presentation/bloc/plans_bloc.dart';
import 'package:red_host_app/src/core/client_http/dio/rest_client_dio_impl.dart';

final injector = GetIt.instance;

void initDependencies() {
/*   injector.registerFactory<DioFactory>(
    () => DioFactory(),
  );
  final dios = injector<DioFactory>(); */

  injector.registerFactory<RestClientDioImpl>(
    () => RestClientDioImpl(
      dio: DioFactory.dio(),
    ),
  );
  injector.registerFactory<AuthRemoteDatasource>(
    () => AuthRemoteDatasource(
      restClient: injector<RestClientDioImpl>(),
    ),
  );

  injector.registerFactory<AuthRepositoryImpl>(() => AuthRepositoryImpl(
      authRemoteDatasource: injector<AuthRemoteDatasource>()));

  injector.registerFactory<LoginUsecase>(
    () => LoginUsecase(
      authRepository: injector<AuthRepositoryImpl>(),
    ),
  );

  injector.registerFactory<RegisterUsecase>(
    () => RegisterUsecase(
      authRepository: injector<AuthRepositoryImpl>(),
    ),
  );

  injector.registerLazySingleton<AuthBloc>(
    () => AuthBloc(
      loginUsecase: injector<LoginUsecase>(),
      registerUsecase: injector<RegisterUsecase>(),
    ),
  );

  //Plans

  injector.registerFactory<PlansRemoteDatasource>(
    () => PlansRemoteDatasource(
      restClient: injector<RestClientDioImpl>(),
    ),
  );

  injector.registerFactory<PlanRepositoryImpl>(
    () => PlanRepositoryImpl(
      remoteDatasource: injector<PlansRemoteDatasource>(),
    ),
  );

  injector.registerFactory<GetPlansUsecase>(
    () => GetPlansUsecase(
      repository: injector<PlanRepositoryImpl>(),
    ),
  );

  injector.registerLazySingleton<PlansBloc>(() => PlansBloc(
        getPlansUsecase: injector<GetPlansUsecase>(),
      ));
}
