import 'package:interview_prj/presentation/assign_student/assign_student_model.dart';
import 'package:interview_prj/presentation/classroom_layout/model/classroom_layout_model.dart';

import '/core/app_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'assign_student_to_classroom_state.dart';

/// A bloc that manages the state of a AssignStudentToClassroom according to the event that is dispatched to it.
class AssignStudentToClassroomCubit extends Cubit<AssignStudentToClassroomState>
    with UrlConstants {
  AssignStudentToClassroomCubit() : super(AssignStudentToClassroomInitial());

  getAssignStudentToClassroom({studentId, subjectId, classroomId}) async {
    emit(AssignStudentToClassroomLoading());

    try {
      final response = await NetWorkManager.shared().request(
          url: "$baseUrl${classroom(classroomId)}",
          method: RequestMethods.get,
          isAuthRequired: false);

      final classroomData = ClassroomDetailsModel.fromJson(response);
      if (classroomData.subject == null) {
        emit(AssignStudentToClassroomError(""));
        return;
      }

      final data = await NetWorkManager.shared().request(
          url: "$baseUrl${registration()}",
          method: RequestMethods.post,
          params: {"subject": subjectId, "student": studentId},
          isAuthRequired: false);

      emit(AssignStudentToClassroomLoaded(
          assignStudentModel: AssignStudentModel.fromJson(data)));
    } catch (e) {
      log("===$e");
      emit(AssignStudentToClassroomError("${e}"));
    }
  }
}
