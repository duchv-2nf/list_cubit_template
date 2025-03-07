part of '{{featureName.snakeCase()}}_list_page.dart';

class _{{featureName.pascalCase()}}ListView extends StatefulWidget {
  const _{{featureName.pascalCase()}}ListView();

  @override
  _{{featureName.pascalCase()}}ListViewState createState() => _{{featureName.pascalCase()}}ListViewState();
}

class _{{featureName.pascalCase()}}ListViewState extends State<_{{featureName.pascalCase()}}ListView> {
  late {{featureName.pascalCase()}}ListCubit _{{featureName.snakeCase()}}ListCubit;
  final _scrollController = ScrollController();

  @override
  void initState() {
    _{{featureName.snakeCase()}}ListCubit = context.read<{{featureName.pascalCase()}}ListCubit>();
    super.initState();

    _scrollController.addListener(_onScroll);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _{{featureName.snakeCase()}}ListCubit.fetch{{featureName.pascalCase()}}s();
    });
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
       _{{featureName.snakeCase()}}ListCubit.loadMore{{featureName.pascalCase()}}s();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("{{featureName}} List"),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<{{featureName.pascalCase()}}ListCubit, {{featureName.pascalCase()}}ListState>(
      builder: (context, state) {
        final {{featureName.camelCase()}}s = state.{{featureName.camelCase()}}s;
        final isLoadMoreLoading = state.isLoading && state.loadingType == {{featureName.pascalCase()}}LoadingType.loadMore;

        final isLoadingInit = state.isLoading && state.loadingType == {{featureName.pascalCase()}}LoadingType.initial;
        if (isLoadingInit) {
          return const Center(child: CircularProgressIndicator());
        }

        return RefreshIndicator(
          onRefresh: () => _{{featureName.snakeCase()}}ListCubit.refresh{{featureName.pascalCase()}}s(),
          child: ListView.builder(
            controller: _scrollController,
            itemCount: {{featureName.camelCase()}}s.length + (isLoadMoreLoading ? 1 : 0),
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final isLoadingMoreItem = index >= {{featureName.camelCase()}}s.length;
              if (isLoadingMoreItem) {
                return _buildLoadingMoreWidget();
              }
              final item = {{featureName.camelCase()}}s[index];
              return {{featureName.pascalCase()}}ListItem(item: item);
            },
          ),
        );
      },
    );
  }

  Padding _buildLoadingMoreWidget() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(child: CircularProgressIndicator()),
    );
  }
}