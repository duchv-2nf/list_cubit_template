import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '{{featureName.snakeCase()}}_cubit.dart';

part '{{featureName.snakeCase()}}_view.dart';

class {{featureName.pascalCase()}}Page extends StatelessWidget {
  const {{featureName.pascalCase()}}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return {{featureName.pascalCase()}}Cubit();
      },
      child: BlocListener<{{featureName.pascalCase()}}Cubit, {{featureName.pascalCase()}}State>(
        listener: (context, state) {
          state.whenOrNull(failure: (errorMessage) {
            _onShowErrorMessage(context, errorMessage: errorMessage);
          });
        },
        child: _{{featureName.pascalCase()}}View(),
      ),
    );
  }

  void _onShowErrorMessage(BuildContext context, {
    required String errorMessage,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
