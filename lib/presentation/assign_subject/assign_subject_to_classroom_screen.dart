import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_prj/core/app_export.dart';
import 'package:interview_prj/presentation/assign_subject/bloc/assign_subject_to_classroom_cubit.dart';
import 'package:interview_prj/presentation/classroom_layout/bloc/classroom_layout_cubit.dart';
import 'package:interview_prj/presentation/subjects/bloc/subjects_cubit.dart';
import 'package:interview_prj/presentation/subjects/models/subjects_model.dart';
import 'package:interview_prj/widgets/custom_snack.dart';

class AssignSubjectToClassroom extends StatefulWidget {
  const AssignSubjectToClassroom({super.key});

  @override
  State<AssignSubjectToClassroom> createState() =>
      _AssignSubjectToClassroomState();
}

class _AssignSubjectToClassroomState extends State<AssignSubjectToClassroom> {
  Subjects? dropdownvalue;
  int? classRoomId;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Assign Subject to Classroom")),
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
                  BlocBuilder<ClassroomDetailsCubit, ClassroomDetailsState>(
                    builder: (context, state) {
                      if (state is ClassroomDetailsLoaded) {
                        classRoomId = state.classroomModel!.id;
                        return Text("${state.classroomModel!.name}");
                      }
                      return Container();
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Icon(Icons.arrow_forward),
                  const SizedBox(
                    width: 20,
                  ),
                  BlocBuilder<SubjectCubit, SubjectState>(
                      builder: (context, state) {
                    if (state is SubjectLoaded) {
                      return DropdownButton(
                        value: dropdownvalue,
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
                            dropdownvalue = newValue!;
                          });
                        },
                      );
                    }
                    return Container();
                  })
                ],
              ),
              BlocListener<AssignSubjectToClassroomCubit,
                  AssignSubjectToClassroomState>(
                listener: (context, state) {
                  CustomSnackbar.showSnackbar(
                      context: context,
                      backgroundColor: Colors.black.withOpacity(0.7),
                      message: AppStrings.subjectAssignSuccessMessage);
                },
                child: ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<AssignSubjectToClassroomCubit>(context)
                          .getAssignSubjectToClassroom(
                              classRoomId, dropdownvalue!.id);
                    },
                    child: Text("Assign")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
