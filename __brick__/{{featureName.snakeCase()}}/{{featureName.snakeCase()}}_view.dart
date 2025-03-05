part of '{{featureName.snakeCase()}}_page.dart';

class _{{featureName.pascalCase()}}View extends StatefulWidget {
  const _{{featureName.pascalCase()}}View();

  @override
  _{{featureName.pascalCase()}}ViewState createState() => _{{featureName.pascalCase()}}ViewState();
}

class _{{featureName.pascalCase()}}ViewState extends State<_{{featureName.pascalCase()}}View> {
  late {{featureName.pascalCase()}}Cubit _{{featureName.snakeCase()}}Cubit;

  @override
  void initState() {
    _{{featureName.snakeCase()}}Cubit = context.read<{{featureName.pascalCase()}}Cubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<{{featureName.pascalCase()}}Cubit, {{featureName.pascalCase()}}State>(
      builder: (context, state) {
        return state.maybeWhen(
          failure: (error) {
            return Text(error);
          },
          orElse: () {
            return Text("{{featureName}}");
          },
        );
      },
    );
  }
}