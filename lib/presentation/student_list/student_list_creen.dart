import 'package:hamon/core/app_export.dart';
import 'package:hamon/presentation/student_list/bloc/student_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      appBar: AppBar(title: Text("Students",)),

      body: Column(
        children: [
          Container(
            height: 400,
            width: double.infinity,
            child: BlocBuilder<StudentCubit, StudentState>(
              builder: (context, state) {
                if (state is StudentLoading) {
                  return Container(
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
                        return Container(
                          child:
                              Text("${state.studentModel!.students![index].name}"),
                        );
                      });
                }
                if (state is StudentError) {
                  Fluttertoast.showToast(msg: "${state.error}");
                }
                return Container();
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              
            },
            child: Text("Product List"),
          ),
        ],
      ),
    );
  }
}
