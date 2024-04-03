import '../../../../lib.dart';

enum CustomersStateEnum {
  addNewCustomer,
  listCustomers,
}

class CustomersState extends ViewModelState {
  const CustomersState();
}

class AddNewCustomersState extends CustomersState {
  const AddNewCustomersState();
}

class ListCustomersState extends CustomersState {
  const ListCustomersState();
}
