import 'package:androidker_sneaker/infras/product_details_remote_service.dart';
import 'package:dartz/dartz.dart';
import 'package:model/model.dart';

class ProductDetailsRepository {
  ProductDetailsRepository(this._detailsRemoteService);

  final ProductDetailsRemoteService _detailsRemoteService;

  Future<Either<CommonError, Product>> getProductDetails(String id) async {
    try {
      final product = await _detailsRemoteService.getProductDetails(id);
      return right(product);
    } catch (error) {
      return left(CommonError(error.toString()));
    }
  }
}
