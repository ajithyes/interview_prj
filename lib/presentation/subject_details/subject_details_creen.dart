import 'package:interview_prj/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_prj/presentation/subject_details/bloc/subject_details_cubit.dart';
import 'package:interview_prj/widgets/listview_widget.dart';

class SubjectDetailScreen extends StatefulWidget {
  const SubjectDetailScreen({super.key});

  @override
  State<SubjectDetailScreen> createState() => _SubjectDetailScreenState();
}

class _SubjectDetailScreenState extends State<SubjectDetailScreen> {
  @override
  void initState() {
    super.initState();
   
    
  }

  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Subject Details",
      )),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<SubjectDetailCubit, SubjectDetailState>(
              builder: (context, state) {
                if (state is SubjectDetailLoading) {
                  return Center(
                    child: Column(children: [
                      CircularProgressIndicator(),
                    ]),
                  );
                }
                if (state is SubjectDetailLoaded) {
                 
                        return ListItemWidget(
                          title: state.studentDetailModel!.name,
                          text: "${state.studentDetailModel!.teacher}",
                          subText:
                              "${state.studentDetailModel!.credits}",
                        );
                      }
                
                if (state is SubjectDetailError) {
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
