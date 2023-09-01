import '/core/app_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'assign_subject_to_classroom_state.dart';

/// A bloc that manages the state of a AssignSubjectToClassroom according to the event that is dispatched to it.
class AssignSubjectToClassroomCubit extends Cubit<AssignSubjectToClassroomState>
    with UrlConstants {
  AssignSubjectToClassroomCubit() : super(AssignSubjectToClassroomInitial());

  getAssignSubjectToClassroom(id, subjectId) async {
    emit(AssignSubjectToClassroomLoading());

    try {
      final data = await NetWorkManager.shared().request(
          url: "$baseUrl${assignToClassroom(id)}",
          method: RequestMethods.patch,
          params: {"subject": subjectId},
          isAuthRequired: false);
      

      emit(AssignSubjectToClassroomLoaded(
          message: AppStrings.subjectAssignSuccessMessage));
    } catch (e) {
      log("$e");
      emit(AssignSubjectToClassroomError("${e}"));
      // await Future.delayed(Duration(seconds: 1));
      // getAssignSubjectToClassroom(id,subjectId);
    }
  }
}
