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
    final loggedUser = await usecase.call(login: login);
    final newState =
        loggedUser.fold((l) => ErrorLoginState(errorMessage: l.message), (st) {
      saveSessionTokenUsecase.call(st: st);
      return const SuccessLoginState();
    });
    emit(newState);
  }
}
