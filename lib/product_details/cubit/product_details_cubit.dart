import 'package:androidker_sneaker/infras/infras.dart';
import 'package:androidker_sneaker/product_details/view/select_product_size_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:model/model.dart';

enum CommonCubitStatus { initial, loading, loaded, error }

const kAvailableSizes = [8, 8.5, 9, 9.5, 10, 10.5, 11, 11.5];

class ProductDetailsState {
  ProductDetailsState({
    required this.status,
    this.errorMsg,
    this.product,
    this.favorite = false,
    this.selectedSize,
  });

  factory ProductDetailsState.initial() => ProductDetailsState(
        status: CommonCubitStatus.initial,
      );

  final CommonCubitStatus status;
  final String? errorMsg;
  final Product? product;
  final bool favorite;
  final num? selectedSize;
}

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(this._productDetailsRepository)
      : super(ProductDetailsState.initial());

  final ProductDetailsRepository _productDetailsRepository;

  void selectSize(num size) {
    emit(
      ProductDetailsState(
        status: state.status,
        errorMsg: state.errorMsg,
        product: state.product,
        favorite: state.favorite,
        selectedSize: size,
      ),
    );
  }

  void onBuyPressed(BuildContext context) {
    showModalBottomSheet<int>(
      context: context,
      useRootNavigator: true,
      backgroundColor: Colors.black,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(36),
        ),
      ),
      builder: (ctx) => SelectProductSizeDialog(cubit: this),
    );
  }

  void markFavorite() {
    emit(
      ProductDetailsState(
        status: state.status,
        errorMsg: state.errorMsg,
        product: state.product,
        favorite: !state.favorite,
        selectedSize: state.selectedSize,
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
