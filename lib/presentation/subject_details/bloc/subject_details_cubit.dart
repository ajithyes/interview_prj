import 'package:interview_prj/presentation/subjects/models/subjects_model.dart';
import '/core/app_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'subject_details_state.dart';

/// A bloc that manages the state of a Subject according to the event that is dispatched to it.
class SubjectDetailCubit extends Cubit<SubjectDetailState> with UrlConstants {
  SubjectDetailCubit() : super(SubjectDetailInitial());

  getSubjectDetail(id) async {
    emit(SubjectDetailLoading());

    try {
      final data = await NetWorkManager.shared().request(
          url: "$baseUrl${subject(id)}",
          method: RequestMethods.get,
          isAuthRequired: false);

      emit(SubjectDetailLoaded(studentDetailModel: Subjects.fromJson(data)));
    } catch (e) {
      log("$e");
      emit(SubjectDetailError("${e}"));
      await Future.delayed(Duration(seconds: 1));
      getSubjectDetail(id);
    }
  }
}
