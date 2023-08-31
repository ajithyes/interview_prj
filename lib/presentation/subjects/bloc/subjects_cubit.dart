


import 'package:hamon/presentation/subjects/models/subjects_model.dart';

import '/core/app_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'subjects_state.dart';

/// A bloc that manages the state of a Subject according to the event that is dispatched to it.
class SubjectCubit extends Cubit<SubjectState> with UrlConstants {
  SubjectCubit() : super(SubjectInitial());

  getSubjects() async {
    emit(SubjectLoading());

    try {
      final  data = await NetWorkManager.shared().request(
          url: "$baseUrl$subjects",
          method: RequestMethods.get,
          isAuthRequired: false);

      emit(SubjectLoaded(
          subjectModel: SubjectModel.fromJson(data)));
    } catch (e) {
      log("$e");
      emit(SubjectError("${e}"));
    }
  }
}
