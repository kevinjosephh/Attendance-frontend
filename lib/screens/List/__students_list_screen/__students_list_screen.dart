import 'package:attendance/screens/Register/__User_register_screen__/User_register_screen.dart';
import 'package:flutter/material.dart';

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({super.key});

  @override
  State<StudentListScreen> createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
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
    Text("Students List");
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
        "Students", //give here appBar title
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
            return User_register_screen() ;
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