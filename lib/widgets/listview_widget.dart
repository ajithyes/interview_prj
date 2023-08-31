import 'package:flutter/material.dart';
import 'package:interview_prj/core/app_export.dart';


class ListItemWidget extends StatelessWidget {
  final String? title;
  final String? text;
  final String? subText;
  final VoidCallback? onPressed;

  ListItemWidget({
    super.key,
    this.title,
    this.text,
    this.subText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          height: 90,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$title",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              if (text != null)
                Column(children: [
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "$text",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  )
                ]),
              if (subText != null)
                Column(
                  children: [
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "$subText",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.greenAccent,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
