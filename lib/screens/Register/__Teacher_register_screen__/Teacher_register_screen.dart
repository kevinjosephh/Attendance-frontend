import 'package:flutter/material.dart';

import 'Teacher_register_form/Teacher_register_delete_button.dart';
import 'Teacher_register_form/Teacher_register_form_widget.dart';

/* -------------------------------------------------------------------------- */
/*                               //@ Stateful                                 */
/* -------------------------------------------------------------------------- */

class Teacher_register_screen extends StatefulWidget {
  final singleObj;

  Teacher_register_screen({this.singleObj});
  Teacher_register_screen.named(this.singleObj);

  @override
  _Teacher_register_screenState createState() =>
      _Teacher_register_screenState();
}

/* -------------------------------------------------------------------------- */
/*                               //@ State class                              */
/* -------------------------------------------------------------------------- */

class _Teacher_register_screenState extends State<Teacher_register_screen> {
  //* Declaration
  final formKey1 = GlobalKey<FormState>();

/* -------------------------------------------------------------------------- */
/*                             //@ Controllers                                */
/* -------------------------------------------------------------------------- */

  // create controllers here
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  // TextEditingController roleController = TextEditingController();
  TextEditingController rollNoController = TextEditingController();
  TextEditingController classNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
/* -------------------------------------------------------------------------- */
/*                           //! Life cycle methods                           */
/* -------------------------------------------------------------------------- */

  @override
  void initState() {
    super.initState();
    if (widget.singleObj == null) {
      //pass all the controllers here
      firstNameController.text;
      lastNameController.text;
      // roleController.text;
      rollNoController.text;
      classNameController.text;
      emailController.text;
      passwordController.text;

      // assign controller to model props
    } else {
      firstNameController.text = widget.singleObj!.firstName;
      lastNameController.text = widget.singleObj!.lastName;
      // roleController.text = widget.singleObj!.role;
      rollNoController.text = widget.singleObj!.rollNo;
      classNameController.text = widget.singleObj!.className;
      emailController.text = widget.singleObj!.email;
      passwordController.text = widget.singleObj!.password;
    }
  }

/* -------------------------------------------------------------------------- */
/*                            //!  Build                                      */
/* -------------------------------------------------------------------------- */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // resizeToAvoidBottomInset: false,
        appBar: myHeader(),
        body: addStudent());
  }

/* -------------------------------------------------------------------------- */
/*                              //@ Widgets here                              */
/* -------------------------------------------------------------------------- */

  myBody() {
    return Center(child: Text("Student List"));
  }

  addStudent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(20.0),
          //   child: Image.asset('images/index.png'),
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Teacher_register_form_widget(
              singleObj: widget.singleObj,
              formKey: formKey1,
              firstName: firstNameController,
              lastName: lastNameController,
              // role: roleController,
              rollNo: rollNoController,
              className: classNameController,
              kevin: emailController,
              password: passwordController,
            ),
          ),
        ],
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                                  // appbar                                 */
/* -------------------------------------------------------------------------- */

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
        widget.singleObj != null
            ? "Update"
            : "ADD TEACHER", //give here appBar title
        style: TextStyle(
          color: Color.fromARGB(255, 8, 40, 75),
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
      // actions: [
      //   //! Delete button
      //   Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: IconButton(
      //             onPressed: () {
      //               Navigator.push(context,
      //         MaterialPageRoute(builder: (context) {
      //       return addStudent() ;
      //     }));
      //             },
      //             icon: Icon(
      //               Icons.add_circle_sharp ,
      //               color: Colors.black,
      //             )),
      //       )
      // ],
    );
  }
}
