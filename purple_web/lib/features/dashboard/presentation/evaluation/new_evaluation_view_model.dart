import '../../../../lib.dart';
import '../../dashboard.dart';

class NewEvaluationViewmodel extends ViewModel<NewEvaluationState> {
  //final ISaveEvaluationUsecase usecase;
  //EvaluationsViewmodel({required this.usecase}) : super(const EvaluationsState());

  NewEvaluationViewmodel() : super(const NewEvaluationState());

  void saveEvaluation({required User user}) async {
    //emit(const LoadingEvaluationsState());
    //final loggedUser = await usecase.call(user: user);
    //final newState = loggedUser.fold(
    //    (l) => ErrorEvaluationsState(errorMessage: l.message),
    //    (r) => r
    //        ? const SuccessEvaluationsState()
    //        : const ErrorEvaluationsState(
    //            errorMessage: 'Erro ao salvar um novo paciente.'));
    //emit(newState);
  }
}
