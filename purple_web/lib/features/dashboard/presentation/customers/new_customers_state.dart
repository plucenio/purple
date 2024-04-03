import '../../../../lib.dart';

class NewCustomerState extends ViewModelState {
  const NewCustomerState();
}

class LoadingCustomersState extends NewCustomerState {
  const LoadingCustomersState();
}

class SuccessCustomersState extends NewCustomerState {
  const SuccessCustomersState();
}

class ErrorCustomersState extends NewCustomerState {
  final String errorMessage;
  const ErrorCustomersState({required this.errorMessage});
}
