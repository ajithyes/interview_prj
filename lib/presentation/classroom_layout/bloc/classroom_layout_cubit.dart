import 'package:interview_prj/presentation/classroom_layout/model/classroom_layout_model.dart';
import '/core/app_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'classroom_layout_state.dart';

/// A bloc that manages the state of a ClassroomDetails according to the event that is dispatched to it.
class ClassroomDetailsCubit extends Cubit<ClassroomDetailsState>
    with UrlConstants {
  ClassroomDetailsCubit() : super(ClassroomDetailsInitial());

  getClassroomDetails(id) async {
    emit(ClassroomDetailsLoading());

    try {
      final data = await NetWorkManager.shared().request(
          url: "$baseUrl${classroom(id)}",
          method: RequestMethods.get,
          isAuthRequired: false);

      emit(ClassroomDetailsLoaded(
          classroomModel: ClassroomDetailsModel.fromJson(data)));
    } catch (e) {
      log("$e");
      emit(ClassroomDetailsError("${e}"));
      await Future.delayed(Duration(seconds: 1));
      getClassroomDetails(id);
    }
  }
}
