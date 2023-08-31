// ignore_for_file: must_be_immutable

part of 'student_detail_cubit.dart';
@override
abstract class StudentDetailState {
  StudentDetailState();
}


class StudentDetailInitial extends StudentDetailState {}

class StudentDetailLoading extends StudentDetailState {}

class StudentDetailLoaded extends StudentDetailState {
  Students? studentDetailModel;
  StudentDetailLoaded({this.studentDetailModel});
}

class StudentDetailError extends StudentDetailState {
  String error;
  StudentDetailError(this.error);
}
