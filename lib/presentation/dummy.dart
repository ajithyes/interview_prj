import 'package:flutter/material.dart';
import 'package:hamon/routes/app_routes.dart';

class DummyScreen extends StatelessWidget {
  const DummyScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context,PageRoutes.homeScreen);
              
            },
            child: Text("Login Screen"),
          ),
          
        ],
      ),
    );
  }
}
