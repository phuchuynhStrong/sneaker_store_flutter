import 'package:androidker_sneaker/infras/home_remote_service.dart';
import 'package:dartz/dartz.dart';
import 'package:model/model.dart';

class HomeRepository {
  HomeRepository(this._homeRemoteService);

  final HomeRemoteService _homeRemoteService;

  Future<Either<CommonError, List<ProductTag>>> fetchTags() async {
    try {
      final tags = await _homeRemoteService.fetchProductTags();
      return right(tags);
    } catch (error) {
      return left(CommonError(error.toString()));
    }
  }

  Future<Either<CommonError, List<Product>>> getProductsByCategory(
    String categoryId,
  ) async {
    try {
      final products =
          await _homeRemoteService.getProductsWithCategory(categoryId);
      return right(products);
    } catch (error) {
      return left(CommonError(error.toString()));
    }
  }
}
