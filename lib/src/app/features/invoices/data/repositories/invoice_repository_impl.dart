import 'dart:developer';

import 'package:fpdart/fpdart.dart';
import 'package:red_host_app/src/app/features/invoices/data/datasources/remote_datasource_invoice.dart';
import 'package:red_host_app/src/app/features/invoices/data/models/invoice_model.dart';
import 'package:red_host_app/src/app/features/invoices/domain/entities/invoice_entity.dart';
import 'package:red_host_app/src/app/features/invoices/domain/repositories/invoice_repository_interface.dart';
import 'package:red_host_app/src/core/client_http/app_response.dart';
import 'package:red_host_app/src/core/client_http/client_http.dart';
import 'package:red_host_app/src/core/errors/errors.dart';
import 'package:red_host_app/src/core/typedefs/types.dart';

class InvoiceRepositoryImpl implements InvoiceRepositoryInterface {
  final InvoiceRemoteDatasource _remoteDatasource;

  InvoiceRepositoryImpl({
    required InvoiceRemoteDatasource remoteDatasource,
  }) : _remoteDatasource = remoteDatasource;

  @override
  Future<Output<List<InvoiceEntity>>> getById(
      {required String idClient}) async {
    try {
      final response = await _remoteDatasource.get(
        RestClientRequest(path: '/api/invoices/client/$idClient'),
      );
      log(response.data.toString());
      if (response.statusCode == 200) {
        final invoices = AppResponse<List<InvoiceEntity>>.fromJson(
          response.data,
          (dynamic json) => (json as List)
              .map((e) => InvoiceModel.fromJson(e as Map<String, dynamic>))
              .toList(),
        );
        return Right(invoices);
      }
      return Left(
        DefaultException(message: response.data['message']),
      );
    } catch (e) {
      return Left(
        DefaultException(message: e.toString()),
      );
    }
  }
}
