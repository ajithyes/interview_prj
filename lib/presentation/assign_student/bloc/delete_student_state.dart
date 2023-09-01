// ignore_for_file: must_be_immutable

part of 'delete_student_cubit.dart';
@override
abstract class DeleteStudentState {
  DeleteStudentState();
}


class DeleteStudentInitial extends DeleteStudentState {}

class DeleteStudentLoading extends DeleteStudentState {}

class DeleteStudentLoaded extends DeleteStudentState {
  DeleteStudentModel? deleteStudentModel;
  DeleteStudentLoaded({this.deleteStudentModel});
}

class DeleteStudentError extends DeleteStudentState {
  String error;
  DeleteStudentError(this.error);
}


class DeleteStudentModel {
  String? message;

  DeleteStudentModel({this.message});

  DeleteStudentModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    return data;
  }
}
