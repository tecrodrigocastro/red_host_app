import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:red_host_app/src/app/features/invoices/domain/entities/invoice_entity.dart';

part 'invoices_event.dart';
part 'invoices_state.dart';

class InvoicesBloc extends Bloc<InvoicesEvent, InvoicesState> {
  InvoicesBloc() : super(InvoicesInitial()) {
    on<InvoicesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
