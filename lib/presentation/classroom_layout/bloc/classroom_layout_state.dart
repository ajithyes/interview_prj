// ignore_for_file: must_be_immutable

part of 'classroom_layout_cubit.dart';
@override
abstract class ClassroomDetailsState {
  ClassroomDetailsState();
}


class ClassroomDetailsInitial extends ClassroomDetailsState {}

class ClassroomDetailsLoading extends ClassroomDetailsState {}

class ClassroomDetailsLoaded extends ClassroomDetailsState {
  ClassroomDetailsModel? classroomModel;
  ClassroomDetailsLoaded({this.classroomModel});
}

class ClassroomDetailsError extends ClassroomDetailsState {
  String error;
  ClassroomDetailsError(this.error);
}
