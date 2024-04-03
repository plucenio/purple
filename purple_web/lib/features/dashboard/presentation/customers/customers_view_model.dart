import '../../../../lib.dart';
import '../../dashboard.dart';

class CustomerViewmodel extends ViewModel<CustomerState> {
  CustomerViewmodel() : super(const ListCustomersState());

  void changeState({required CustomersStateEnum state}) async {
    if (state == CustomersStateEnum.addNewCustomer) {
      emit(const AddNewCustomerState());
      return;
    }
    if (state == CustomersStateEnum.listCustomers) {
      emit(const ListCustomersState());
    }
  }
}
