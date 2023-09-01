import 'package:interview_prj/core/app_export.dart';
import 'package:interview_prj/presentation/student_detail/bloc/student_detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_prj/widgets/listview_widget.dart';

class StudentDetailScreen extends StatefulWidget {
  const StudentDetailScreen({super.key});

  @override
  State<StudentDetailScreen> createState() => _StudentDetailScreenState();
}

class _StudentDetailScreenState extends State<StudentDetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Student Details",
        ),
        
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<StudentDetailCubit, StudentDetailState>(
              builder: (context, state) {
                if (state is StudentDetailLoading) {
                  return Center(
                    child: Column(children: [
                      CircularProgressIndicator(),
                    ]),
                  );
                }
                if (state is StudentDetailLoaded) {
                  return ListItemWidget(
                    title: state.studentDetailModel!.name,
                    text: "${state.studentDetailModel!.email}",
                    subText: "${state.studentDetailModel!.age}",
                  );
                }

                if (state is StudentDetailError) {
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
