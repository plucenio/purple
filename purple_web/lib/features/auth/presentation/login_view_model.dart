import '../../../lib.dart';

class LoginViewmodel extends ViewModel<LoginState> {
  final ILoginUsecase usecase;
  LoginViewmodel({required this.usecase}) : super(const LoginState());

  void login({required User user}) async {
    final loggedUser = await usecase.login(user: user);
    final newState = loggedUser.fold(
        (l) => LoginErrorState(errorMessage: l.message),
        (r) => const SuccessLoginState());
    emit(newState);
  }
}
