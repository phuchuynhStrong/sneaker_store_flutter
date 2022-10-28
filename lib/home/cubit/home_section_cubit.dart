import 'package:androidker_sneaker/infras/infras.dart';
import 'package:bloc/bloc.dart';
import 'package:model/model.dart';

enum HomeSectionStateStatus {
  loading,
  loaded,
  failed,
  none,
}

class HomeSectionState {
  HomeSectionState({
    required this.status,
    required this.products,
    this.errorMsg,
  });

  factory HomeSectionState.initial() => HomeSectionState(
        status: HomeSectionStateStatus.none,
        products: [],
      );

  final HomeSectionStateStatus status;
  final List<Product> products;
  final String? errorMsg;
}

class HomeSectionCubit extends Cubit<HomeSectionState> {
  HomeSectionCubit(this._homeRepository, this.categoryId)
      : super(HomeSectionState.initial());

  final HomeRepository _homeRepository;
  final String categoryId;

  Future<void> initialize() async {
    emit(
      HomeSectionState(
        status: HomeSectionStateStatus.loading,
        products: state.products,
      ),
    );

    final res = await _homeRepository.getProductsByCategory(categoryId);

    return res.fold(
      (failure) => emit(
        HomeSectionState(
          status: HomeSectionStateStatus.failed,
          products: [],
          errorMsg: failure.errorMsg,
        ),
      ),
      (products) => emit(
        HomeSectionState(
          status: HomeSectionStateStatus.loaded,
          products: products,
        ),
      ),
    );
  }
}
