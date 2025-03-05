part of 'login_page.dart';

class _LoginView extends StatefulWidget {
  const _LoginView();

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<_LoginView> {
  late LoginCubit _loginCubit;

  @override
  void initState() {
    _loginCubit = context.read<LoginCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return state.maybeWhen(
          failure: (error) {
            return Text(error);
          },
          orElse: () {
            return Text("login");
          },
        );
      },
    );
  }
}