import 'package:flutter/material.dart';

import 'User_cud_form/User_cud_delete_button.dart';
import 'User_cud_form/User_cud_form_widget.dart';

/* -------------------------------------------------------------------------- */
/*                               //@ Stateful                                 */
/* -------------------------------------------------------------------------- */

class User_cud_screen extends StatefulWidget {
  final singleObj;

  User_cud_screen({this.singleObj});
  User_cud_screen.named(this.singleObj);

  @override
  _User_cud_screenState createState() => _User_cud_screenState();
}

/* -------------------------------------------------------------------------- */
/*                               //@ State class                              */
/* -------------------------------------------------------------------------- */

class _User_cud_screenState extends State<User_cud_screen> {
  //* Declaration
  final formKey1 = GlobalKey<FormState>();

/* -------------------------------------------------------------------------- */
/*                             //@ Controllers                                */
/* -------------------------------------------------------------------------- */

  // create controllers here
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
      emailController.text;
      passwordController.text;

      // assign controller to model props
    } else {
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
        body: myBody());
  }

/* -------------------------------------------------------------------------- */
/*                              //@ Widgets here                              */
/* -------------------------------------------------------------------------- */

  myBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset('images/index.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: User_cud_form_widget(
              singleObj: widget.singleObj,
              formKey: formKey1,
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
        widget.singleObj != null ? "Update" : "LogIn", //give here appBar title
        style: TextStyle(color: Color.fromARGB(255, 8, 40, 75),
            fontWeight: FontWeight.bold,
            fontSize: 25,
            ),
      ),
      // actions: [
      //   //! Delete button
      //   widget.singleObj != null
      //       ? User_cud_delete_button(
      //           singleObj: widget.singleObj,
      //         )
      //       : Text('')
      // ],
    );
  }
}
