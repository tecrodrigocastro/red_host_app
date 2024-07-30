import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:red_host_app/src/app/features/invoices/domain/entities/invoice_entity.dart';
import 'package:red_host_app/src/app/features/invoices/domain/usecases/get_invoices_by_id_usecase.dart';

part 'invoices_event.dart';
part 'invoices_state.dart';

class InvoicesBloc extends Bloc<InvoicesEvent, InvoicesState> {
  final GetInvoicesByIdUsecase _getInvoicesByIdUsecase;
  InvoicesBloc({
    required GetInvoicesByIdUsecase getInvoicesByIdUsecase,
  })  : _getInvoicesByIdUsecase = getInvoicesByIdUsecase,
        super(InvoicesInitial()) {
    on<GetInvoicesEvent>((event, emit) async {
      emit(InvoicesLoading());

      final response = await _getInvoicesByIdUsecase.call(
        GetInvoicesByIdUsecaseParams(idClient: event.clientId),
      );

      response.fold(
        (l) => emit(InvoicesError(message: l.message)),
        (r) => emit(InvoicesLoaded(invoices: r.data!)),
      );
    });
  }
}
