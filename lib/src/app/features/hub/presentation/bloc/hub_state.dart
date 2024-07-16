part of 'hub_bloc.dart';

abstract class HubState extends Equatable {
  const HubState();  

  @override
  List<Object> get props => [];
}
class HubInitial extends HubState {}
