import 'package:flutter/material.dart';
import 'package:interview_prj/core/app_export.dart';
import 'package:interview_prj/presentation/classroom_layout/bloc/classroom_layout_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_prj/presentation/student_list/bloc/student_cubit.dart';
import 'package:interview_prj/presentation/subjects/bloc/subjects_cubit.dart';
import 'package:interview_prj/widgets/custom_loader.dart';

class ClassroomLayoutSceen extends StatefulWidget {
  const ClassroomLayoutSceen({super.key});

  @override
  State<ClassroomLayoutSceen> createState() => _ClassroomLayoutSceenState();
}

class _ClassroomLayoutSceenState extends State<ClassroomLayoutSceen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClassroomDetailsCubit, ClassroomDetailsState>(
      builder: (context, state) {
        if (state is ClassroomDetailsLoading) {
          return const Column(
            children: [CircularProgressIndicator()],
          );
        }
        if (state is ClassroomDetailsLoaded) {
          return Scaffold(
            appBar: AppBar(
              title: Text("${state.classroomModel!.name}"),
            ),
            body: SafeArea(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                            onPressed: () async {
                              await BlocProvider.of<SubjectCubit>(context)
                                  .getSubjects();
                              Navigator.pushNamed(
                                  context, PageRoutes.assignSubjectToClassroom);
                            },
                            child: Text(
                              "Assign Subject",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )),
                        ElevatedButton(
                            onPressed: () async {
                              SquareLoader.show(context);
                              await BlocProvider.of<SubjectCubit>(context)
                                  .getSubjects();
                              await BlocProvider.of<StudentCubit>(context)
                                  .getStudents();
                              SquareLoader.dismiss(context);
                              Navigator.pushNamed(
                                  context, PageRoutes.assignStudentToClassroom);
                            },
                            child: Text(
                              "Assign Student",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.black,
                        )),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "T",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.sp,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 10,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 10,
                                ),
                                child: state.classroomModel!.layout ==
                                        AppConstants.classroom
                                    ? GridView.builder(
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                        ),
                                        itemCount:
                                            state.classroomModel!.size ?? 0,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "S",
                                              style: TextStyle(fontSize: 15.sp),
                                            ),
                                          );
                                        })
                                    : GridView.builder(
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount:
                                              3, // Number of columns in the grid
                                        ),
                                        itemCount: (state
                                                    .classroomModel!.size ??
                                                0) +
                                            ((state.classroomModel!.size ?? 0) /
                                                    2)
                                                .round(), // Total numbers in the sequence: (100 - 2) / 3 + 1
                                        itemBuilder: (context, index) {
                                          Border border = const Border(
                                            left: BorderSide(
                                              color: Colors.black,
                                              width: 1.0,
                                            ),
                                            right: BorderSide(
                                                color: Colors.black,
                                                width: 1.0),
                                          );
                                          if (index == 1) {
                                            border = const Border(
                                              top: BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0),
                                              left: BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0),
                                              right: BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0),
                                            );
                                          }

                                          if (((state.classroomModel!.size ??
                                                      0) +
                                                  ((state.classroomModel!
                                                                  .size ??
                                                              0) /
                                                          2)
                                                      .round() -
                                                  2) ==
                                              index) {
                                            border = const Border(
                                              bottom: BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0),
                                              left: BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0),
                                              right: BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0),
                                            );
                                          }

                                          return index % 3 == 1
                                              ? Container(
                                                  decoration: BoxDecoration(
                                                    border: border,
                                                  ),
                                                )
                                              : Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'S',
                                                      style: TextStyle(
                                                          fontSize: 15.sp),
                                                    ),
                                                  ],
                                                );
                                        },
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
