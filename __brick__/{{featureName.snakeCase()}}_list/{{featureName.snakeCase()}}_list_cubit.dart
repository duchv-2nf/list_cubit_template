import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '{{featureName.snakeCase()}}_list_cubit.freezed.dart';
part '{{featureName.snakeCase()}}_list_state.dart';


// TODO: DELETE IT
class {{featureName.pascalCase()}}Model {
  final String id;
  final String title;
  final String content;

  {{featureName.pascalCase()}}Model({required this.id, required this.title, required this.content});
}

// TODO: DELETE IT
Future<List<{{featureName.pascalCase()}}Model>> apiFetch{{featureName.pascalCase()}}({int page = 1, int limit = 10}) async {
  await Future.delayed(const Duration(seconds: 2));
  return List.generate(
    limit,
    (index) => {{featureName.pascalCase()}}Model(
      id: 'id_${(page - 1) * limit + index}',
      title: 'Notification ${(page - 1) * limit + index}',
      content: 'This is content for notification ${(page - 1) * limit + index}',
    ),
  );
}

class {{featureName.pascalCase()}}ListCubit extends Cubit<{{featureName.pascalCase()}}ListState> {
  {{featureName.pascalCase()}}ListCubit() : super(const {{featureName.pascalCase()}}ListState());

  Future<void> fetch{{featureName.pascalCase()}}s() async {
    try {
      if (state.isLoading) return;
      emit(state.copyWith(
        isLoading: true,
        errorMessage: "",
        loadingType: {{featureName.pascalCase()}}LoadingType.initial,
      ));
      final page = state.page;
      final pageSize = state.pageSize;

      final {{featureName.snakeCase()}}s = await apiFetch{{featureName.pascalCase()}}(
        page: page,
        limit: pageSize,
      );
      emit(
        state.copyWith(
          {{featureName.snakeCase()}}s: {{featureName.snakeCase()}}s,
          isLoading: false,
          isCanLoadMore: {{featureName.snakeCase()}}s.length == pageSize,
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

  Future<void> refresh{{featureName.pascalCase()}}s() async {
    try {
      if (state.isLoading) return;

      emit(
        state.copyWith(
          isLoading: true,
          page: 1,
          errorMessage: "",
          loadingType: {{featureName.pascalCase()}}LoadingType.refresh,
        ),
      );
      final page = state.page;
      final pageSize = state.pageSize;

      final {{featureName.snakeCase()}}s = await apiFetch{{featureName.pascalCase()}}(
        page: page,
        limit: pageSize,
      );

      final isCanLoadMore = {{featureName.snakeCase()}}s.length == pageSize;

      emit(
        state.copyWith(
          {{featureName.snakeCase()}}s: {{featureName.snakeCase()}}s,
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

  Future<void> loadMore{{featureName.pascalCase()}}s() async {
    if (!state.isCanLoadMore || state.isLoading) {
      return;
    }
    emit(
      state.copyWith(
        isCanLoadMore: false,
        isLoading: true,
        page: state.page + 1,
        errorMessage: "",
        loadingType: {{featureName.pascalCase()}}LoadingType.loadMore,
      ),
    );

    try {
      final page = state.page;
      final pageSize = state.pageSize;

      final {{featureName.snakeCase()}}s = await apiFetch{{featureName.pascalCase()}}(
        page: page,
        limit: pageSize,
      );
      final isCanLoadMore = {{featureName.snakeCase()}}s.length == pageSize;

      emit(
        state.copyWith(
          {{featureName.snakeCase()}}s: [...state.{{featureName.snakeCase()}}s, ...{{featureName.snakeCase()}}s],
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
