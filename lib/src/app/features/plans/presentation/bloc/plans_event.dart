part of 'plans_bloc.dart';

abstract class PlansEvent extends Equatable {
  const PlansEvent();

  @override
  List<Object> get props => [];
}

class GetPlansEvent extends PlansEvent {}
