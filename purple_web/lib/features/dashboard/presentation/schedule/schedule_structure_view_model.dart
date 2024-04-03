import '../../../../lib.dart';
import '../../dashboard.dart';

class ScheduleStructureViewmodel extends ViewModel<ScheduleStructureState> {
  ScheduleStructureViewmodel() : super(const ScheduleState());

  void changeState({required ScheduleStructureStateEnum state}) async {
    if (state == ScheduleStructureStateEnum.addNewScheduleStructure) {
      emit(const AddNewScheduleStructureState());
      return;
    }
    if (state == ScheduleStructureStateEnum.schedule) {
      emit(const ScheduleState());
      return;
    }
  }
}
