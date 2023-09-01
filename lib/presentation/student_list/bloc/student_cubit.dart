import 'package:interview_prj/presentation/student_list/models/student_model.dart';
import '/core/app_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'student_state.dart';

/// A bloc that manages the state of a Student according to the event that is dispatched to it.
class StudentCubit extends Cubit<StudentState> with UrlConstants {
  StudentCubit() : super(StudentInitial());

  getStudents() async {
    emit(StudentLoading());

    try {
      final data = await NetWorkManager.shared().request(
          url: "$baseUrl$students",
          method: RequestMethods.get,
          isAuthRequired: false);

      emit(StudentLoaded(studentModel: StudentModel.fromJson(data)));
    } catch (e) {
      log("$e");
      emit(StudentError("${e}"));
      await Future.delayed(Duration(seconds: 1));
      getStudents();
    }
  }
}
