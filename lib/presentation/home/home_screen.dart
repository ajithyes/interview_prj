import 'package:flutter/material.dart';
import 'package:interview_prj/core/app_export.dart';
import 'package:interview_prj/core/constants/app_strings.dart';
import 'package:interview_prj/presentation/home/widget/home_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<HomeWidgetData> menu=[];
  @override
  void initState() {
    super.initState();
    menu = [
     HomeWidgetData(title:  ButtonStrings.student,
     onPressed: 
      () {
        Navigator.pushNamed(context, PageRoutes.studentScreen);
      },),
      HomeWidgetData(title:  ButtonStrings.subject,
     onPressed: 
      () {
        Navigator.pushNamed(context, PageRoutes.subjectScreen);
      },),
      HomeWidgetData(title:  ButtonStrings.classroom,
     onPressed: 
      () {
        Navigator.pushNamed(context, PageRoutes.classRoomScreen);
      },),
     
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: menu.length,
          itemBuilder: (context, index) => HomeWidget(
            title: menu[index].title,
            onPressed: menu[index].onPressed,
          ),
        ),
      ),
    );
  }
}

class HomeWidgetData {
  final String? title;
  final VoidCallback? onPressed;
  HomeWidgetData({
this.title,
this.onPressed,
  });
}
