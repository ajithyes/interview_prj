import 'package:flutter/material.dart';
import 'package:hamon/presentation/classroom/bloc/classroom_cubit.dart';
import 'package:hamon/presentation/student_list/bloc/student_cubit.dart';
import 'package:hamon/presentation/subjects/bloc/subjects_cubit.dart';
import 'package:hamon/core/app_export.dart';
import 'package:hamon/presentation/splash_screen.dart';
import 'package:hamon/routes/app_routes.dart';
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
          return  Sizer(builder: (context, orientation, deviceType) {
              return MultiBlocProvider(
                  providers: [
                     BlocProvider<StudentCubit>(create: (context) => StudentCubit()),
                     BlocProvider<SubjectCubit>(create: (context) => SubjectCubit()),
                     BlocProvider<ClassroomCubit>(create: (context) => ClassroomCubit()),
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
            }
          );
        });
  }
}
