import '/core/app_export.dart';
import 'package:interview_prj/presentation/Student_list/models/Student_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'student_detail_state.dart';

/// A bloc that manages the state of a Student according to the event that is dispatched to it.
class StudentDetailCubit extends Cubit<StudentDetailState> with UrlConstants {
  StudentDetailCubit() : super(StudentDetailInitial());
  Students? studentData;

  getStudentDetail(id) async {
    emit(StudentDetailLoading());

    try {
      final data = await NetWorkManager.shared().request(
          url: "$baseUrl${student(id)}",
          method: RequestMethods.get,
          isAuthRequired: false);
      studentData = Students.fromJson(data);
      emit(StudentDetailLoaded(studentDetailModel: studentData));
    } catch (e) {
      log("$e");
      emit(StudentDetailError("${e}"));
      await Future.delayed(Duration(seconds: 1));
      getStudentDetail(id);
    }
  }
}
