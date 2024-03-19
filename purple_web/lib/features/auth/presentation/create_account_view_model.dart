import '../../../lib.dart';

class CreateAccountViewmodel extends ViewModel<CreateAccountState> {
  final ICreateAccountUsecase usecase;
  CreateAccountViewmodel({required this.usecase})
      : super(const CreateAccountState());

  void createAccount({required User user}) async {
    final loggedUser = await usecase.call(user: user);
    final newState = loggedUser.fold(
        (l) => ErrorCreateAccountState(errorMessage: l.message),
        (r) => r
            ? const SuccessCreateAccountState()
            : const ErrorCreateAccountState(
                errorMessage: 'Erro ao criar conta.'));
    emit(newState);
  }
}
