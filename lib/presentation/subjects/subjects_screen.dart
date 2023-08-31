import 'package:hamon/core/app_export.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamon/presentation/subjects/bloc/subjects_cubit.dart';

class SubjectScreen extends StatefulWidget {
  const SubjectScreen({super.key});

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SubjectCubit>(context).getSubjects();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Subjects",)),
      body: Column(
        children: [
          Container(
            height: 400,
            width: double.infinity,
            child: BlocBuilder<SubjectCubit, SubjectState>(
              builder: (context, state) {
                if (state is SubjectLoading) {
                  return Container(
                    child: Column(children: [
                      CircularProgressIndicator(),
                    ]),
                  );
                }
                if (state is SubjectLoaded) {
                  return ListView.builder(
                      itemCount: state.subjectModel!.subjects!.length,
                      shrinkWrap: true,
                      itemBuilder: (ctx, index) {
                        return Container(
                          child:
                              Text("${state.subjectModel!.subjects![index].name}"),
                        );
                      });
                }
                if (state is SubjectError) {
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
