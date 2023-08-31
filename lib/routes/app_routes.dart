import 'package:hamon/presentation/classroom/classroom_screen.dart';
import 'package:hamon/presentation/home/home_screen.dart';
import 'package:hamon/presentation/splash_screen.dart';
import 'package:hamon/presentation/student_list/student_list_creen.dart';
import 'package:hamon/presentation/subjects/subjects_screen.dart';

class PageRoutes {
  static const String splashScreen = "/";
  static const String homeScreen = "/homeScreen";
  static const String studentScreen = "/studentScreen";
  static const String classRoomScreen = "/classRoomScreen";
  static const String subjectScreen = "/subjectScreen";
  
  
}

class Routes {
  static final routes = {
   PageRoutes.splashScreen: (context) => SplashScreen(),
   PageRoutes.homeScreen: (context) => HomeScreen(),
   PageRoutes.studentScreen: (context) =>StudentScreen(),
   PageRoutes.classRoomScreen: (context) =>ClassroomScreen(),
   PageRoutes.subjectScreen: (context) =>SubjectScreen(),
       
  };
}
