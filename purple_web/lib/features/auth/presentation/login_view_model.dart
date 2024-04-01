import '../../../lib.dart';
import '../auth.dart';

class LoginViewmodel extends ViewModel<LoginState> {
  final ILoginUsecase usecase;
  final ISaveSessionTokenUsecase saveSessionTokenUsecase;

  LoginViewmodel({
    required this.usecase,
    required this.saveSessionTokenUsecase,
  }) : super(const LoginState());

  void login({required Login login}) async {
    emit(const LoadingLoginState());
    final loggedUser = await usecase.call(login: login);
    final newState = loggedUser
        .fold((l) => ErrorLoginState(errorMessage: l.message), (sessionToken) {
      saveSessionTokenUsecase.call(sessionToken: sessionToken);
      return const SuccessLoginState();
    });
    emit(newState);
  }
}
