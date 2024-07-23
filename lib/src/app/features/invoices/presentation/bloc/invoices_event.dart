part of 'invoices_bloc.dart';

abstract class InvoicesEvent extends Equatable {
  const InvoicesEvent();

  @override
  List<Object> get props => [];
}

class GetInvoicesEvent extends InvoicesEvent {
  final String clientId;

  const GetInvoicesEvent({required this.clientId});
}
