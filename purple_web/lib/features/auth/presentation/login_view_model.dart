import '../../../lib.dart';
import '../auth.dart';

class LoginViewmodel extends ViewModel<LoginState> {
  final ILoginUsecase usecase;
  LoginViewmodel({required this.usecase}) : super(const LoginState());

  void login({required Login login}) async {
    final loggedUser = await usecase.call(login: login);
    final newState = loggedUser.fold(
        (l) => ErrorLoginState(errorMessage: l.message),
        (r) => const SuccessLoginState());
    emit(newState);
  }
}
