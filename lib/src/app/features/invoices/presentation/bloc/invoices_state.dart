part of 'invoices_bloc.dart';

abstract class InvoicesState extends Equatable {
  const InvoicesState();

  @override
  List<Object> get props => [];
}

class InvoicesInitial extends InvoicesState {}

class InvoicesLoading extends InvoicesState {}

class InvoicesLoaded extends InvoicesState {
  final List<InvoiceEntity> invoices;

  const InvoicesLoaded({required this.invoices});

  @override
  List<Object> get props => [invoices];
}

class InvoicesError extends InvoicesState {
  final String message;

  const InvoicesError({required this.message});

  @override
  List<Object> get props => [message];
}
