import 'package:androidker_sneaker/infras/infras.dart';
import 'package:bloc/bloc.dart';
import 'package:model/model.dart';

enum CommonCubitStatus { initial, loading, loaded, error }

class ProductDetailsState {
  ProductDetailsState({
    required this.status,
    this.errorMsg,
    this.product,
    this.favorite = false,
  });

  factory ProductDetailsState.initial() => ProductDetailsState(
        status: CommonCubitStatus.initial,
      );

  final CommonCubitStatus status;
  final String? errorMsg;
  final Product? product;
  final bool favorite;
}

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(this._productDetailsRepository)
      : super(ProductDetailsState.initial());

  final ProductDetailsRepository _productDetailsRepository;

  void markFavorite() {
    emit(
      ProductDetailsState(
        status: state.status,
        errorMsg: state.errorMsg,
        product: state.product,
        favorite: !state.favorite,
      ),
    );
  }

  Future<void> initialize(String id) async {
    emit(
      ProductDetailsState(
        status: CommonCubitStatus.loading,
        product: state.product,
        errorMsg: state.errorMsg,
      ),
    );

    final res = await _productDetailsRepository.getProductDetails(id);

    return res.fold(
      (l) => emit(
        ProductDetailsState(
          status: CommonCubitStatus.error,
          errorMsg: l.errorMsg,
        ),
      ),
      (r) => emit(
        ProductDetailsState(
          status: CommonCubitStatus.loaded,
          product: r,
        ),
      ),
    );
  }
}
