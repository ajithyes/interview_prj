import 'package:interview_prj/core/app_export.dart';
import 'package:interview_prj/presentation/student_detail/bloc/student_detail_cubit.dart';
import 'package:interview_prj/presentation/student_list/bloc/student_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_prj/widgets/custom_loader.dart';
import 'package:interview_prj/widgets/listview_widget.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({super.key});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<StudentCubit>(context).getStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Students",
      )),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<StudentCubit, StudentState>(
              builder: (context, state) {
                if (state is StudentLoading) {
                  return Center(
                    child: Column(children: [
                      CircularProgressIndicator(),
                    ]),
                  );
                }
                if (state is StudentLoaded) {
                  return ListView.builder(
                      itemCount: state.studentModel!.students!.length,
                      shrinkWrap: true,
                      itemBuilder: (ctx, index) {
                        return ListItemWidget(
                            title: state.studentModel!.students![index].name,
                            text:
                                "${state.studentModel!.students![index].email}",
                            subText:
                                "${state.studentModel!.students![index].age}",
                            onPressed: () async {
                              SquareLoader.show(context);
                              await BlocProvider.of<StudentDetailCubit>(context)
                                  .getStudentDetail(
                                      state.studentModel!.students![index].id);
                              SquareLoader.dismiss(context);

                              Navigator.pushNamed(
                                  context, PageRoutes.studentDetailScreen);
                            });
                      });
                }
                if (state is StudentError) {
                  Fluttertoast.showToast(msg: "${state.error}");
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
