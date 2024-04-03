import '../../../../lib.dart';

enum CustomersStateEnum {
  addNewCustomer,
  listCustomers,
}

class CustomerState extends ViewModelState {
  const CustomerState();
}

class AddNewCustomerState extends CustomerState {
  const AddNewCustomerState();
}

class ListCustomersState extends CustomerState {
  const ListCustomersState();
}
