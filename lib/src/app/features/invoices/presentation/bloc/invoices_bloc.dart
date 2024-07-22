import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'invoices_event.dart';
part 'invoices_state.dart';

class InvoicesBloc extends Bloc<InvoicesEvent, InvoicesState> {
  InvoicesBloc() : super(InvoicesInitial()) {
    on<InvoicesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
