import '../../../lib.dart';

class CreateAccountState extends ViewModelState {
  const CreateAccountState();
}

class LoadingCreateAccountState extends CreateAccountState {
  const LoadingCreateAccountState();
}

class SuccessCreateAccountState extends CreateAccountState {
  const SuccessCreateAccountState();
}

class ErrorCreateAccountState extends CreateAccountState {
  final String errorMessage;
  const ErrorCreateAccountState({required this.errorMessage});
}
