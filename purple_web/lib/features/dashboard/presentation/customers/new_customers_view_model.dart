import '../../../../lib.dart';
import '../../dashboard.dart';

class NewCustomerViewmodel extends ViewModel<NewCustomerState> {
  //final ISaveCustomerUsecase usecase;
  //CustomersViewmodel({required this.usecase}) : super(const CustomersState());

  NewCustomerViewmodel() : super(const NewCustomerState());

  void saveCustomer({required User user}) async {
    //emit(const LoadingCustomersState());
    //final loggedUser = await usecase.call(user: user);
    //final newState = loggedUser.fold(
    //    (l) => ErrorCustomersState(errorMessage: l.message),
    //    (r) => r
    //        ? const SuccessCustomersState()
    //        : const ErrorCustomersState(
    //            errorMessage: 'Erro ao salvar um novo paciente.'));
    //emit(newState);
  }
}
