import 'package:flutter/material.dart';
import 'package:interview_prj/presentation/assign_student/bloc/assign_student_to_classroom_cubit.dart';
import 'package:interview_prj/presentation/assign_student/bloc/delete_student_cubit.dart';
import 'package:interview_prj/presentation/assign_subject/bloc/assign_subject_to_classroom_cubit.dart';
import 'package:interview_prj/presentation/classroom/bloc/classroom_cubit.dart';
import 'package:interview_prj/presentation/classroom_layout/bloc/classroom_layout_cubit.dart';
import 'package:interview_prj/presentation/student_detail/bloc/student_detail_cubit.dart';
import 'package:interview_prj/presentation/student_list/bloc/student_cubit.dart';
import 'package:interview_prj/presentation/subject_details/bloc/subject_details_cubit.dart';
import 'package:interview_prj/presentation/subjects/bloc/subjects_cubit.dart';
import 'package:interview_prj/core/app_export.dart';
import 'package:interview_prj/routes/app_routes.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
        future: SecureStorageManager.shared.gePreferences(),
        builder: (context, snapshot) {
          return Sizer(builder: (context, orientation, deviceType) {
            return MultiBlocProvider(
                providers: [
                  BlocProvider<StudentCubit>(
                      create: (context) => StudentCubit()),
                  BlocProvider<SubjectCubit>(
                      create: (context) => SubjectCubit()),
                  BlocProvider<ClassroomCubit>(
                      create: (context) => ClassroomCubit()),
                  BlocProvider<StudentDetailCubit>(
                      create: (context) => StudentDetailCubit()),
                  BlocProvider<SubjectDetailCubit>(
                      create: (context) => SubjectDetailCubit()),
                  BlocProvider<ClassroomDetailsCubit>(
                      create: (context) => ClassroomDetailsCubit()),
                  BlocProvider<AssignSubjectToClassroomCubit>(
                      create: (context) => AssignSubjectToClassroomCubit()),
                  BlocProvider<AssignStudentToClassroomCubit>(
                      create: (context) => AssignStudentToClassroomCubit()),
                  BlocProvider<DeleteStudentCubit>(
                      create: (context) => DeleteStudentCubit()),
                ],
                child: MaterialApp(
                  navigatorKey: navigatorKey,
                  debugShowCheckedModeBanner: false,
                  // initialRoute: PageRoutes.dummyScreen,
                  initialRoute: PageRoutes.splashScreen,
                  routes: Routes.routes,
                  // home: Scaffold(
                  //   body: SplashScreen(),
                  // ),
                ));
          });
        });
  }
}
