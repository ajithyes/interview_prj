// ignore_for_file: must_be_immutable

part of 'assign_subject_to_classroom_cubit.dart';
@override
abstract class AssignSubjectToClassroomState {
  AssignSubjectToClassroomState();
}


class AssignSubjectToClassroomInitial extends AssignSubjectToClassroomState {}

class AssignSubjectToClassroomLoading extends AssignSubjectToClassroomState {}

class AssignSubjectToClassroomLoaded extends AssignSubjectToClassroomState {
  String? message;
  AssignSubjectToClassroomLoaded({this.message});
}

class AssignSubjectToClassroomError extends AssignSubjectToClassroomState {
  String error;
  AssignSubjectToClassroomError(this.error);
}
