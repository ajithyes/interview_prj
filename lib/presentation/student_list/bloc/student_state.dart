// ignore_for_file: must_be_immutable

part of 'student_cubit.dart';
@override
abstract class StudentState {
  StudentState();
}


class StudentInitial extends StudentState {}

class StudentLoading extends StudentState {}

class StudentLoaded extends StudentState {
  StudentModel? studentModel;
  StudentLoaded({this.studentModel});
}

class StudentError extends StudentState {
  String error;
  StudentError(this.error);
}
