import 'package:red_host_app/src/app/features/invoices/domain/entities/invoice_entity.dart';
import 'package:red_host_app/src/core/typedefs/types.dart';

abstract interface class InvoiceRepositoryInterface {
  Future<Output<List<InvoiceEntity>>> getById({required String idClient});
}
