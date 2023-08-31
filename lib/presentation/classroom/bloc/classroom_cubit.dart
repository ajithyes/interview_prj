import 'package:interview_prj/presentation/classroom/models/classroom_model.dart';

import '/core/app_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'classroom_state.dart';

/// A bloc that manages the state of a Classroom according to the event that is dispatched to it.
class ClassroomCubit extends Cubit<ClassroomState> with UrlConstants {
  ClassroomCubit() : super(ClassroomInitial());

  getClassrooms() async {
    emit(ClassroomLoading());

    try {
      final data = await NetWorkManager.shared().request(
          url: "$baseUrl$classrooms",
          method: RequestMethods.get,
          isAuthRequired: false);

      emit(ClassroomLoaded(classroomModel: ClassroomModel.fromJson(data)));
    } catch (e) {
      log("$e");
      emit(ClassroomError("${e}"));
      await Future.delayed(Duration(seconds: 1));
      getClassrooms();
    }
  }
}
