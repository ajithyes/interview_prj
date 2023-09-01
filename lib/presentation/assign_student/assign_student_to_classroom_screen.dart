import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_prj/core/app_export.dart';
import 'package:interview_prj/presentation/assign_student/bloc/assign_student_to_classroom_cubit.dart';
import 'package:interview_prj/presentation/assign_student/bloc/delete_student_cubit.dart';
import 'package:interview_prj/presentation/classroom_layout/bloc/classroom_layout_cubit.dart';
import 'package:interview_prj/presentation/student_list/bloc/student_cubit.dart';
import 'package:interview_prj/presentation/student_list/models/student_model.dart';
import 'package:interview_prj/presentation/subjects/bloc/subjects_cubit.dart';
import 'package:interview_prj/presentation/subjects/models/subjects_model.dart';

class AssignStudentToClassroom extends StatefulWidget {
  const AssignStudentToClassroom({super.key});

  @override
  State<AssignStudentToClassroom> createState() =>
      _AssignStudentToClassroomState();
}

class _AssignStudentToClassroomState extends State<AssignStudentToClassroom> {
  Subjects? subjectDropdownvalue;
  Students? studentDropdownvalue;
  int? registrationId;
  List<Students> students = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Assign Student to Classroom")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<SubjectCubit, SubjectState>(
                      builder: (context, state) {
                    if (state is SubjectLoaded) {
                      return DropdownButton(
                        value: subjectDropdownvalue,
                        hint: Text('Select a subject'),
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items:
                            state.subjectModel!.subjects!.map((Subjects items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items.name ?? ""),
                          );
                        }).toList(),
                        onChanged: (Subjects? newValue) {
                          setState(() {
                            subjectDropdownvalue = newValue!;
                          });
                        },
                      );
                    }
                    return Container();
                  }),
                  const SizedBox(
                    width: 40,
                  ),
                  BlocBuilder<StudentCubit, StudentState>(
                      builder: (context, state) {
                    if (state is StudentLoaded) {
                      return DropdownButton(
                        value: studentDropdownvalue,
                        hint: Text('Select a student'),
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items:
                            state.studentModel!.students!.map((Students items) {
                          return DropdownMenuItem<Students>(
                            value: items,
                            child: Text(items.name ?? ""),
                          );
                        }).toList() as List<DropdownMenuItem<Students>>,
                        onChanged: (Students? newValue) {
                          setState(() {
                            studentDropdownvalue = newValue!;
                          });
                        },
                      );
                    }
                    return Container();
                  }),
                ],
              ),
              BlocListener<AssignStudentToClassroomCubit,
                  AssignStudentToClassroomState>(
                listener: (context, state) {
                  if (state is AssignStudentToClassroomLoaded) {
                    registrationId =
                        state.assignStudentModel!.registration!.id!;
                    CustomSnackbar.showSnackbar(
                        context: context,
                        backgroundColor: Colors.green.withOpacity(0.7),
                        message: AppStrings.subjectAssignSuccessMessage);
                    setState(() {});
                  }
                  if (state is AssignStudentToClassroomError) {
                    CustomSnackbar.showSnackbar(
                        context: context,
                        backgroundColor: Colors.red.withOpacity(0.7),
                        message: state.error);
                  }
                },
                child:
                    BlocBuilder<ClassroomDetailsCubit, ClassroomDetailsState>(
                  builder: (context, state) {
                    if (state is ClassroomDetailsLoaded) {
                      return ElevatedButton(
                          onPressed: () {
                            if (studentDropdownvalue == null) {
                              CustomSnackbar.showSnackbar(
                                  context: context,
                                  backgroundColor: Colors.red.withOpacity(0.7),
                                  message: "Please select a student");
                              return;
                            }
                            if (subjectDropdownvalue == null) {
                              CustomSnackbar.showSnackbar(
                                  context: context,
                                  backgroundColor: Colors.red.withOpacity(0.7),
                                  message: "Please select a subject");
                              return;
                            }
                            BlocProvider.of<AssignStudentToClassroomCubit>(
                                    context)
                                .getAssignStudentToClassroom(
                                    studentId: studentDropdownvalue!.id,
                                    subjectId: subjectDropdownvalue!.id,
                                    classroomId: state.classroomModel!.id);
                          },
                          child: Text("Assign"));
                    }
                    return Container();
                  },
                ),
              ),
              if (registrationId != null)
                BlocListener<DeleteStudentCubit, DeleteStudentState>(
                  listener: (context, state) {
                    if (state is DeleteStudentLoaded) {
                      registrationId = null;
                      CustomSnackbar.showSnackbar(
                          context: context,
                          backgroundColor: Colors.black.withOpacity(0.7),
                          message: AppStrings.studentAssignSuccessMessage);
                    }
                    if (state is DeleteStudentError) {
                      CustomSnackbar.showSnackbar(
                          context: context,
                          backgroundColor: Colors.red.withOpacity(0.7),
                          message: state.error);
                    }
                    setState(() {});
                  },
                  child: ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<DeleteStudentCubit>(context)
                            .deleteStudentToClassroom(
                          registrationId: registrationId,
                        );
                      },
                      child: Text("Delete")),
                )
            ],
          ),
        ),
      ),
    );
  }
}
