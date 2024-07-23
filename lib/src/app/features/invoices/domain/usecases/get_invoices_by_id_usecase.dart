import 'package:red_host_app/src/app/features/invoices/domain/entities/invoice_entity.dart';
import 'package:red_host_app/src/app/features/invoices/domain/repositories/invoice_repository_interface.dart';
import 'package:red_host_app/src/core/typedefs/types.dart';
import 'package:red_host_app/src/core/usecase/usecase_interface.dart';

class GetInvoicesByIdUsecase
    implements UseCase<List<InvoiceEntity>, GetInvoicesByIdUsecaseParams> {
  final InvoiceRepositoryInterface _repository;

  GetInvoicesByIdUsecase({
    required InvoiceRepositoryInterface repository,
  }) : _repository = repository;
  @override
  Future<Output<List<InvoiceEntity>>> call(
    GetInvoicesByIdUsecaseParams params,
  ) async {
    return await _repository.getById(idClient: params.idClient);
  }
}

class GetInvoicesByIdUsecaseParams {
  final String idClient;

  GetInvoicesByIdUsecaseParams({
    required this.idClient,
  });
}
