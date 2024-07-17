part of 'plans_bloc.dart';

abstract class PlansState extends Equatable {
  const PlansState();

  @override
  List<Object> get props => [];
}

class PlansInitial extends PlansState {}

class PlansLoading extends PlansState {}

class PlansLoaded extends PlansState {
  final List<PlanEntity> plans;

  const PlansLoaded({required this.plans});

  @override
  List<Object> get props => [plans];
}

class PlansError extends PlansState {
  final String message;

  const PlansError({required this.message});

  @override
  List<Object> get props => [message];
}
