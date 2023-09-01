import '/core/app_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'delete_student_state.dart';

/// A bloc that manages the state of a DeleteStudentToClassroom according to the event that is dispatched to it.
class DeleteStudentCubit extends Cubit<DeleteStudentState>
    with UrlConstants {
  DeleteStudentCubit() : super(DeleteStudentInitial());

  deleteStudentToClassroom({registrationId}) async {
    emit(DeleteStudentLoading());

    try {
      final data = await NetWorkManager.shared().request(
          url: "$baseUrl${registration(id: registrationId)}",
          method: RequestMethods.delete,
          isAuthRequired: false);

      emit(DeleteStudentLoaded(
          deleteStudentModel: DeleteStudentModel.fromJson(data)));
    } catch (e) {
      log("===$e");
      emit(DeleteStudentError("${e}"));
    }
  }
}
