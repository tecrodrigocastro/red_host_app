import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'hub_event.dart';
part 'hub_state.dart';

class HubBloc extends Bloc<HubEvent, HubState> {
  HubBloc() : super(HubInitial()) {
    on<HubEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
