import '../../../../lib.dart';
import '../../dashboard.dart';

class CustomerViewmodel extends ViewModel<CustomersState> {
  CustomerViewmodel() : super(const ListCustomersState());

  void changeState({required CustomersStateEnum state}) async {
    if (state == CustomersStateEnum.addNewCustomer) {
      emit(const AddNewCustomersState());
      return;
    }
    if (state == CustomersStateEnum.listCustomers) {
      emit(const ListCustomersState());
    }
  }
}
