import 'package:attendance/screens/List/__courses_list_screen/__courses_list_screen.dart';
import 'package:attendance/screens/Register/__Class_register_screen__/Class_register_screen.dart';
import 'package:attendance/screens/Register/__User_register_screen__/User_register_screen.dart';
import 'package:attendance/screens/List/__students_list_screen/__students_list_screen.dart';
import 'package:flutter/material.dart';

import '../../../repo_layer/User_repo.dart';
import '../../../service_layer/models/UserModel.dart';
import '../../__Student_fetch_screen__/Student_fetch_screen.dart';

class StudentHomeScreen extends StatefulWidget {
  const StudentHomeScreen({super.key});

  @override
  State<StudentHomeScreen> createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //   ElevatedButton(
            //     child: const Text('STUDENTS'),
            //     onPressed: () {
            //       Navigator.push(context,
            //     MaterialPageRoute(builder: (context) {
            //   return Student_Fetch_Screen()  ;
            // }));
            //     },
            //   ),
            // ElevatedButton(
            //   child: const Text('COURSES'),
            //   onPressed: () {
            //     Navigator.push(context,
            //   MaterialPageRoute(builder: (context) {
            // return CourseListScreen() ;
            //   },));
            //   },
            // ),
            ElevatedButton(
              child: const Text('VIEW ATTENDANCE'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  get_user_role() {
    User_sp_repo user_sp_repo = User_sp_repo();
    UserModel user = user_sp_repo.get_model_user('user');
    return user.role;
  }

  for_students() {
    [
      //   ElevatedButton(
      //     child: const Text('STUDENTS'),
      //     onPressed: () {
      //       Navigator.push(context,
      //     MaterialPageRoute(builder: (context) {
      //   return StudentListScreen() ;
      // }));
      //     },
      //   ),
      //   ElevatedButton(
      //     child: const Text('COURSES'),
      //     onPressed: () {
      //       Navigator.push(context,
      //     MaterialPageRoute(builder: (context) {
      //   return CourseListScreen() ;
      //     },));
      //     },
      //   ),
      ElevatedButton(
        child: const Text('TEACHERS'),
        onPressed: () {},
      ),
    ];
  }
}
