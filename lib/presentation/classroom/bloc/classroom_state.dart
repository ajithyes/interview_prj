// ignore_for_file: must_be_immutable

part of 'classroom_cubit.dart';
@override
abstract class ClassroomState {
  ClassroomState();
}


class ClassroomInitial extends ClassroomState {}

class ClassroomLoading extends ClassroomState {}

class ClassroomLoaded extends ClassroomState {
  ClassroomModel? classroomModel;
  ClassroomLoaded({this.classroomModel});
}

class ClassroomError extends ClassroomState {
  String error;
  ClassroomError(this.error);
}
