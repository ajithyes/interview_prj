// ignore_for_file: must_be_immutable

part of 'subject_details_cubit.dart';
@override
abstract class SubjectDetailState {
  SubjectDetailState();
}


class SubjectDetailInitial extends SubjectDetailState {}

class SubjectDetailLoading extends SubjectDetailState {}

class SubjectDetailLoaded extends SubjectDetailState {
  Subjects? studentDetailModel;
  SubjectDetailLoaded({this.studentDetailModel});
}

class SubjectDetailError extends SubjectDetailState {
  String error;
  SubjectDetailError(this.error);
}
