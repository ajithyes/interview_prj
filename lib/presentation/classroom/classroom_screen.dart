import 'package:hamon/core/app_export.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamon/presentation/classroom/bloc/classroom_cubit.dart';

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
      appBar: AppBar(title: Text("Classroom",)),

      body: Column(
        children: [
          Container(
            height: 400,
            width: double.infinity,
            child: BlocBuilder<ClassroomCubit, ClassroomState>(
              builder: (context, state) {
                if (state is ClassroomLoading) {
                  return Container(
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
                        return Container(
                          child:
                              Text("${state.classroomModel!.classrooms![index].name}"),
                        );
                      });
                }
                if (state is ClassroomError) {
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
