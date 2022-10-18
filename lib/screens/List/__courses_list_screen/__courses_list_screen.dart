import 'package:attendance/screens/Register/__Class_register_screen__/Class_register_screen.dart';
import 'package:attendance/screens/Register/__User_register_screen__/User_register_screen.dart';
import 'package:flutter/material.dart';

class CourseListScreen extends StatefulWidget {
  const CourseListScreen({super.key});

  @override
  State<CourseListScreen> createState() => _CourseListScreenState();
}

class _CourseListScreenState extends State<CourseListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // resizeToAvoidBottomInset: false,
        appBar: myHeader(),
        body: studentsList()
        );
  }
  studentsList(){
    Text("Courses List");
  }

  AppBar myHeader() {
    return AppBar(
      backgroundColor: Colors.redAccent,
      centerTitle: true,
      // elevation: 0.0,
      // leading: IconButton(
      //   icon: Icon(
      //     Icons.arrow_back,
      //     color: Colors.blueAccent,
      //   ),
      //   onPressed: () {
      //     Navigator.pop(context);
      //   },
      // ),
      // automaticallyImplyLeading: true,  //removes default back arrow on appbar

      title: Text(
        "Courses", //give here appBar title
        style: TextStyle(color: Color.fromARGB(255, 8, 40, 75),
            fontWeight: FontWeight.bold,
            fontSize: 25,
            ),
      ),
      actions: [
        //! Delete button
        Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  onPressed: () {
                    Navigator.push(context,
              MaterialPageRoute(builder: (context) {
            return Class_register_screen() ;
          }));
                  },
                  icon: Icon(
                    Icons.add_circle_sharp ,
                    color: Colors.black,
                  )),
            )
      ],
    );
  }
}