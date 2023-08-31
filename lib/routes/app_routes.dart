import 'package:interview_prj/presentation/classroom/classroom_screen.dart';
import 'package:interview_prj/presentation/classroom_layout/classroom_layout_screen.dart';
import 'package:interview_prj/presentation/home/home_screen.dart';
import 'package:interview_prj/presentation/splash_screen.dart';
import 'package:interview_prj/presentation/student_detail/student_detail_creen.dart';
import 'package:interview_prj/presentation/student_list/student_list_creen.dart';
import 'package:interview_prj/presentation/subject_details/subject_details_creen.dart';
import 'package:interview_prj/presentation/subjects/subjects_screen.dart';

class PageRoutes {
  static const String splashScreen = "/";
  static const String homeScreen = "/homeScreen";
  static const String studentScreen = "/studentScreen";
  static const String studentDetailScreen = "/studentDetailScreen";
  static const String classRoomScreen = "/classRoomScreen";
  static const String subjectScreen = "/subjectScreen";
  static const String subjectDetailScreen = "/subjectDetailScreen";
  static const String classroomLayoutSceen = "/classroomLayoutSceen";
}

class Routes {
  static final routes = {
    PageRoutes.splashScreen: (context) => SplashScreen(),
    PageRoutes.homeScreen: (context) => HomeScreen(),
    PageRoutes.studentScreen: (context) => StudentScreen(),
    PageRoutes.studentDetailScreen: (context) => StudentDetailScreen(),
    PageRoutes.classRoomScreen: (context) => ClassroomScreen(),
    PageRoutes.subjectScreen: (context) => SubjectScreen(),
    PageRoutes.subjectDetailScreen: (context) => SubjectDetailScreen(),
    PageRoutes.classroomLayoutSceen: (context) => ClassroomLayoutSceen(),
  };
}
