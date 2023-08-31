
import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  final String? title;
  final VoidCallback? onPressed;
  const HomeWidget({this.title,this.onPressed});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: TextButton(
        onPressed:widget.onPressed,
        child: Container(
          height: 80,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "${widget.title}",
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
