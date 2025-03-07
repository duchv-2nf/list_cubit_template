import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'example_cubit.freezed.dart';
part 'example_state.dart';

class ExampleCubit extends Cubit<ExampleState> {
  ExampleCubit() : super(const ExampleState.initial());

  Future<void> fetchExample() async {
    try {
      if (state.isLoading) return;
      emit(state.copyWith(
        isLoading: true,
        errorMessage: "",
        loadingType: ExampleLoadingType.initial,
      ));
      final page = state.page;
      final pageSize = state.pageSize;

      final example = await apiFetchExample(
        page: page,
        limit: pageSize,
      );
      emit(
        state.copyWith(
          example: example,
          isLoading: false,
          isCanLoadMore: example.length == pageSize,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> refreshExample() async {
    try {
      if (state.isLoading) return;

      emit(
        state.copyWith(
          isLoading: true,
          page: 1,
          errorMessage: "",
          loadingType: ExampleLoadingType.refresh,
        ),
      );
      final page = state.page;
      final pageSize = state.pageSize;

      final example = await apiFetchExample(
        page: page,
        limit: pageSize,
      );

      final isCanLoadMore = example.length == pageSize;

      emit(
        state.copyWith(
          example: example,
          isLoading: false,
          isCanLoadMore: isCanLoadMore,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> loadMoreExample() async {
    if (!state.isCanLoadMore || state.isLoading) {
      return;
    }
    emit(
      state.copyWith(
        isCanLoadMore: false,
        isLoading: true,
        page: state.page + 1,
        errorMessage: "",
        loadingType: ExampleLoadingType.loadMore,
      ),
    );

    try {
      final page = state.page;
      final pageSize = state.pageSize;

      final example = await apiFetchExample(
        page: page,
        limit: pageSize,
      );
      final isCanLoadMore = example.length == pageSize;

      emit(
        state.copyWith(
          example: [...state.example, ...example],
          isLoading: false,
          isCanLoadMore: isCanLoadMore,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
