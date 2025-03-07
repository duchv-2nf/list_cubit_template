part of '{{featureName.snakeCase()}}_list_cubit.dart';

// TODO: - Replace enum to your enum common loading
enum {{featureName.pascalCase()}}LoadingType {
  initial,
  loadMore,
  refresh,
}

@freezed
class {{featureName.pascalCase()}}ListState with _${{featureName.pascalCase()}}ListState {
  const factory {{featureName.pascalCase()}}ListState({
    // Data
    @Default([]) List<{{featureName.pascalCase()}}Model> {{featureName.snakeCase()}}s,

    // Loading
    @Default(false) bool isLoading,
    @Default({{featureName.pascalCase()}}LoadingType.initial) {{featureName.pascalCase()}}LoadingType loadingType,

    // Page, pageSize
    @Default(1) int page,
    @Default(20) int pageSize,
    @Default(false) bool isCanLoadMore,

    // Error
    @Default('') String errorMessage,
  }) = _{{featureName.pascalCase()}}ListState;
}
