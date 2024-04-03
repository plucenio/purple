import '../../../../lib.dart';
import '../../dashboard.dart';

class EvaluationsViewmodel extends ViewModel<EvaluationsState> {
  EvaluationsViewmodel() : super(const ListEvaluationsState());

  void changeState({required EvaluationsStateEnum state}) async {
    if (state == EvaluationsStateEnum.addNewEvaluation) {
      emit(const AddNewEvaluationState());
      return;
    }
    if (state == EvaluationsStateEnum.listEvaluations) {
      emit(const ListEvaluationsState());
    }
  }
}
