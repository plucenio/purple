import '../../../lib.dart';

class LoginState extends ViewModelState {
  const LoginState();
}

class LoadingLoginState extends LoginState {
  const LoadingLoginState();
}

class SuccessLoginState extends LoginState {
  const SuccessLoginState();
}

class ErrorLoginState extends LoginState {
  final String errorMessage;
  const ErrorLoginState({required this.errorMessage});
}
