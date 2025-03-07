part of 'example_cubit.dart';

// TODO: - Replace enum to your enum common loading
enum ExampleLoadingType {
  initial,
  loadMore,
  refresh,
}

@freezed
class ExampleState with _$ExampleState {
  const factory ExampleState({
    // Data
    @Default([]) List<ExampleModel> example,

    // Loading
    @Default(false) bool isLoading,
    @Default(ExampleLoadingType.initial) ExampleLoadingType loadingType,

    // Page, pageSize
    @Default(1) int page,
    @Default(20) int pageSize,
    @Default(false) bool isCanLoadMore,

    // Error
    @Default('') String errorMessage,
  }) = _ExampleState;
}
