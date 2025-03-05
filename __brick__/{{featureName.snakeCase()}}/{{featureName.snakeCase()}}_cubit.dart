import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '{{featureName.snakeCase()}}_cubit.freezed.dart';
part '{{featureName.snakeCase()}}_state.dart';

class {{featureName.pascalCase()}}Cubit extends Cubit<{{featureName.pascalCase()}}State> {
  {{featureName.pascalCase()}}Cubit() : super(const {{featureName.pascalCase()}}State.initial());
}
