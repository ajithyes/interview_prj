import 'package:interview_prj/core/app_export.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_prj/presentation/classroom/bloc/classroom_cubit.dart';
import 'package:interview_prj/widgets/listview_widget.dart';

class ClassroomScreen extends StatefulWidget {
  const ClassroomScreen({super.key});

  @override
  State<ClassroomScreen> createState() => _ClassroomScreenState();
}

class _ClassroomScreenState extends State<ClassroomScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ClassroomCubit>(context).getClassrooms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Classroom",
      )),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ClassroomCubit, ClassroomState>(
              builder: (context, state) {
                if (state is ClassroomLoading) {
                  return Center(
                    child: Column(children: [
                      CircularProgressIndicator(),
                    ]),
                  );
                }
                if (state is ClassroomLoaded) {
                  return ListView.builder(
                      itemCount: state.classroomModel!.classrooms!.length,
                      shrinkWrap: true,
                      itemBuilder: (ctx, index) {
                        return ListItemWidget(
                            title:
                                state.classroomModel!.classrooms![index].name,
                            text:
                                "${state.classroomModel!.classrooms![index].size}",
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, PageRoutes.classroomLayoutSceen,
                                  arguments: {
                                    "classroom": state
                                        .classroomModel!.classrooms![index],
                                  });
                            });
                      });
                }
                if (state is ClassroomError) {
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
