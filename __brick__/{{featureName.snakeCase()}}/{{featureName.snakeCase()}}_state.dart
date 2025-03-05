part of '{{featureName.snakeCase()}}_cubit.dart';

@freezed
class {{featureName.pascalCase()}}State with _${{featureName.pascalCase()}}State {
  
  const factory {{featureName.pascalCase()}}State.initial() = _Initial;

  const factory {{featureName.pascalCase()}}State.loading() = _Loading;

  const factory {{featureName.pascalCase()}}State.success() = _Success;

  const factory {{featureName.pascalCase()}}State.failure({
    @Default("")  String errorMessage,
  }) = _Failure;
}
