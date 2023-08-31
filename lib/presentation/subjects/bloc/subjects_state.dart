

part of 'subjects_cubit.dart';
@override
abstract class SubjectState {
  SubjectState();
}


class SubjectInitial extends SubjectState {}

class SubjectLoading extends SubjectState {}

class SubjectLoaded extends SubjectState {
  SubjectModel? subjectModel;
  SubjectLoaded({this.subjectModel});
}

class SubjectError extends SubjectState {
  String error;
  SubjectError(this.error);
}
