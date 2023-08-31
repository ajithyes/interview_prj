import 'package:flutter/material.dart';
import 'package:hamon/core/app_export.dart';
import 'package:hamon/core/constants/app_strings.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen();

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    init();
  }

  init() async {
    await Future.delayed(Duration(milliseconds: 500));
    if (!(SecureStorageManager.shared.getBoolPre(PreferenceKeys.token) ??
        false)) {
      Navigator.pushNamed(
          context, PageRoutes.homeScreen);
    } 
  }   

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
                        body:  Center(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: AppStrings.appName,
              style: TextStyle(
                
                fontSize: 48,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
      ),
    );
  }
}
