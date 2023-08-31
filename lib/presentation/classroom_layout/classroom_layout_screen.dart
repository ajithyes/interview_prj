import 'package:flutter/material.dart';
import 'package:interview_prj/core/app_export.dart';
import 'package:interview_prj/presentation/classroom/models/classroom_model.dart';

class ClassroomLayoutSceen extends StatefulWidget {
  const ClassroomLayoutSceen({super.key});

  @override
  State<ClassroomLayoutSceen> createState() => _ClassroomLayoutSceenState();
}

class _ClassroomLayoutSceenState extends State<ClassroomLayoutSceen> {
  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final Classrooms classrooms = arguments["classroom"];
    
    
   
    return Scaffold(
      appBar: AppBar(
        title: Text("${classrooms.name}"),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
          decoration: BoxDecoration(
              border: Border.all(
            color: Colors.black,
          )),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "T",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.sp,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                 
                  child: classrooms.layout == AppConstants.classroom
                        ? GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                            ),
                            itemCount: classrooms.size ?? 0,
                            itemBuilder: (context, index) {
                              return Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "S",
                                  style: TextStyle(
                                       fontSize: 15.sp),
                                ),
                              );
                            })
                        :GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // Number of columns in the grid
                    ),
                    itemCount: (classrooms.size ?? 0) +
                        ((classrooms.size ?? 0) / 2)
                            .round(), // Total numbers in the sequence: (100 - 2) / 3 + 1
                    itemBuilder: (context, index) {
                    
                      Border border = const Border(
                        left: BorderSide(color: Colors.black, width: 1.0,),
                        right: BorderSide(color: Colors.black, width: 1.0),
                      );
                      if (index == 1) {
                        border = const Border(
                          top: BorderSide(color: Colors.black, width: 1.0),
                          left: BorderSide(color: Colors.black, width: 1.0),
                          right: BorderSide(color: Colors.black, width: 1.0),
                        );
                      }
                     
                      if (((classrooms.size ?? 0) + ((classrooms.size ?? 0) / 2).round()-2) ==
                          index) {
                        border = const Border(
                          bottom: BorderSide(color: Colors.black, width: 1.0),
                          left: BorderSide(color: Colors.black, width: 1.0),
                          right: BorderSide(color: Colors.black, width: 1.0),
                        );
                      }
                     
                      return index % 3 == 1
                          ? Container(
                              decoration: BoxDecoration(
                                border: border,
                              ),
                            )
                          : Card(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('S',
                                   style: TextStyle(
                                      fontSize: 15.sp),
                                  ),
                                ],
                              ),
                            );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
