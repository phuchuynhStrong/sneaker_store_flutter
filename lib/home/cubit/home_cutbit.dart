import 'package:androidker_sneaker/infras/infras.dart';
import 'package:bloc/bloc.dart';
import 'package:model/model.dart';

enum HomeStateStatus {
  loading,
  loaded,
  failed,
  none,
}

class HomeState {
  HomeState({
    required this.status,
    required this.tags,
    this.errorMsg,
    this.selectedTag,
  });
  factory HomeState.initial() => HomeState(
        status: HomeStateStatus.none,
        tags: [],
      );

  final HomeStateStatus status;
  final List<ProductTag> tags;
  final String? errorMsg;
  final String? selectedTag;
}

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepository) : super(HomeState.initial());

  final HomeRepository _homeRepository;

  void onTagPressed(String tag) {
    if (state.selectedTag == tag) {
      emit(
        HomeState(
          status: state.status,
          tags: state.tags,
          errorMsg: state.errorMsg,
        ),
      );
    } else {
      emit(
        HomeState(
          status: state.status,
          tags: state.tags,
          errorMsg: state.errorMsg,
          selectedTag: tag,
        ),
      );
    }
  }

  Future<void> initialize() async {
    emit(HomeState(status: HomeStateStatus.loading, tags: state.tags));

    final res = await _homeRepository.fetchTags();

    return res.fold(
      (failure) => emit(
        HomeState(
          status: HomeStateStatus.failed,
          tags: [],
          errorMsg: failure.errorMsg,
        ),
      ),
      (tags) => emit(HomeState(status: HomeStateStatus.loaded, tags: tags)),
    );
  }
}
