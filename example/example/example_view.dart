part of 'example_page.dart';

class _ExampleView extends StatefulWidget {
  const _ExampleView();

  @override
  _ExampleViewState createState() => _ExampleViewState();
}

class _ExampleViewState extends State<_ExampleView> {
  late ExampleCubit _exampleCubit;
  final _scrollController = ScrollController();

  @override
  void initState() {
    _exampleCubit = context.read<ExampleCubit>();
    super.initState();

    _scrollController.addListener(_onScroll);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _exampleCubit.fetchExample();
    });
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
       _exampleCubit.loadExample();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("example"),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<ExampleCubit, ExampleState>(
      builder: (context, state) {
        final Example = state.Example;
        final isLoadMoreLoading = state.isLoading && state.loadingType == ExampleLoadingType.loadMore;

        final isLoadingInit = state.isLoading && state.loadingType == ExampleLoadingType.initial;
        if (isLoadingInit) {
          return const Center(child: CircularProgressIndicator());
        }

        return RefreshIndicator(
          onRefresh: () => _exampleCubit.refreshExample(),
          child: ListView.builder(
            controller: _scrollController,
            itemCount: Example.length + (isLoadMoreLoading ? 1 : 0),
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final isLoadingMoreItem = index >= Example.length;
              if (isLoadingMoreItem) {
                return _buildLoadingMoreWidget();
              }
              final item = Example[index];
              return ExampleListItem(item: item);
            },
          ),
        );
      },
    );
  }
}