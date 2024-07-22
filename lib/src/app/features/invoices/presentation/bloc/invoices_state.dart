part of 'invoices_bloc.dart';

abstract class InvoicesState extends Equatable {
  const InvoicesState();  

  @override
  List<Object> get props => [];
}
class InvoicesInitial extends InvoicesState {}
