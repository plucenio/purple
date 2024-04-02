import '../../../../lib.dart';

class CustomersState extends ViewModelState {
  const CustomersState();
}

class LoadingCustomersState extends CustomersState {
  const LoadingCustomersState();
}

class SuccessCustomersState extends CustomersState {
  const SuccessCustomersState();
}

class ErrorCustomersState extends CustomersState {
  final String errorMessage;
  const ErrorCustomersState({required this.errorMessage});
}
