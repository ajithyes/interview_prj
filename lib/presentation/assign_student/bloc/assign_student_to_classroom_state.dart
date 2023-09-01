// ignore_for_file: must_be_immutable

part of 'assign_student_to_classroom_cubit.dart';
@override
abstract class AssignStudentToClassroomState {
  AssignStudentToClassroomState();
}


class AssignStudentToClassroomInitial extends AssignStudentToClassroomState {}

class AssignStudentToClassroomLoading extends AssignStudentToClassroomState {}

class AssignStudentToClassroomLoaded extends AssignStudentToClassroomState {
  AssignStudentModel? assignStudentModel;
  AssignStudentToClassroomLoaded({this.assignStudentModel});
}

class AssignStudentToClassroomError extends AssignStudentToClassroomState {
  String error;
  AssignStudentToClassroomError(this.error);
}
