import 'package:interview_prj/core/app_export.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_prj/presentation/subject_details/bloc/subject_details_cubit.dart';
import 'package:interview_prj/presentation/subjects/bloc/subjects_cubit.dart';
import 'package:interview_prj/widgets/custom_loader.dart';
import 'package:interview_prj/widgets/listview_widget.dart';

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
      appBar: AppBar(
          title: Text(
        "Subjects",
      )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: BlocBuilder<SubjectCubit, SubjectState>(
              builder: (context, state) {
                if (state is SubjectLoading) {
                  return Center(
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
                        return ListItemWidget(
                          title: "${state.subjectModel!.subjects![index].name}",
                          text:
                              "${state.subjectModel!.subjects![index].teacher}",
                          subText:
                              "${state.subjectModel!.subjects![index].credits}",
                          onPressed: () async {
                            SquareLoader.show(context);
                            await BlocProvider.of<SubjectDetailCubit>(context)
                                .getSubjectDetail(
                                    state.subjectModel!.subjects![index].id);
                            SquareLoader.dismiss(context);

                            Navigator.pushNamed(
                                context, PageRoutes.subjectDetailScreen);
                          },
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
        ],
      ),
    );
  }
}
