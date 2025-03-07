import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '{{featureName.snakeCase()}}_list_cubit.dart';
import 'widgets/{{featureName.snakeCase()}}_list_item.dart';

part '{{featureName.snakeCase()}}_list_view.dart';

class {{featureName.pascalCase()}}ListPage extends StatelessWidget {
  const {{featureName.pascalCase()}}ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return {{featureName.pascalCase()}}ListCubit();
      },
      child: BlocListener<{{featureName.pascalCase()}}ListCubit, {{featureName.pascalCase()}}ListState>(
        listener: (context, state) {
          if (state.errorMessage.isNotEmpty) {
            _onShowErrorMessage(
              context,
              errorMessage: state.errorMessage,
            );
          }
        },
        child: const _{{featureName.pascalCase()}}ListView(),
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
