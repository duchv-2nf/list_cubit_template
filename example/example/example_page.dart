import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'example_cubit.dart';

part 'example_view.dart';

class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return ExampleCubit();
      },
      child: BlocListener<ExampleCubit, ExampleState>(
        listener: (context, state) {
          if (state.errorMessage.isNotEmpty) {
            _onShowErrorMessage(
              context,
              errorMessage: state.errorMessage,
            );
          }
        },
        child: const _ExampleView(),
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
