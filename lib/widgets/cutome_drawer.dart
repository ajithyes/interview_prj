import 'package:flutter/material.dart';
import 'package:hamon/core/app_export.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(padding: EdgeInsets.zero, children: <Widget>[
      DrawerHeader(
        child: Text(
          AppStrings.appName,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        
      ),
      drawerItem(
          title: AppStrings.home,
          onPressed: () {
          Navigator.pushNamed(context,PageRoutes.homeScreen);

          }),
     
      drawerItem(title: ButtonStrings.student, onPressed: () {
          Navigator.pushNamed(context,PageRoutes.studentScreen);

      }),
      drawerItem(title: ButtonStrings.subject, onPressed: () {
          Navigator.pushNamed(context,PageRoutes.subjectScreen);

      }),
      drawerItem(title: ButtonStrings.classroom, onPressed: () {
          Navigator.pushNamed(context,PageRoutes.classRoomScreen);

      }),
      
      
    ]));
  }

  ListTile drawerItem({
    String? title,
    VoidCallback? onPressed,
    Widget? icon,
  }) {
    return ListTile(
      title: Text(title ?? ""),
      trailing: IconButton(
        onPressed: onPressed,
        icon: icon ?? Container(),
      ),
    );
  }
}
