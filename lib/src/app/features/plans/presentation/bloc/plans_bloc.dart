import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_host_app/src/app/features/plans/domain/entities/plan_entity.dart';
import 'package:red_host_app/src/app/features/plans/domain/usecases/get_plans_usecase.dart';
import 'package:red_host_app/src/core/usecase/usecase_interface.dart';

part 'plans_event.dart';
part 'plans_state.dart';

class PlansBloc extends Bloc<PlansEvent, PlansState> {
  final GetPlansUsecase _getPlansUsecase;
  PlansBloc({
    required GetPlansUsecase getPlansUsecase,
  })  : _getPlansUsecase = getPlansUsecase,
        super(PlansInitial()) {
    on<GetPlansEvent>((event, emit) async {
      emit(PlansLoading());
      final response = await _getPlansUsecase.call(NoParams());

      response.fold(
        (failure) => emit(PlansError(message: failure.message)),
        (plans) => emit(PlansLoaded(plans: plans.data!)),
      );
    });
  }
}
