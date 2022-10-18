import 'dart:convert';

import 'package:attendance/repo_layer/User_repo.dart';
import 'package:attendance/screens/Splash/__splash_screen__/Splash_screen.dart';
import 'package:attendance/service_layer/models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Logic/Logout_logic/logout_bloc.dart';
import '../../Logic/StudentProfile_fetch_id_logic/studentProfile_fetch_id_bloc.dart';

//to change class name = right click on className> Rename symbol
class StudentProfile_Screen extends StatelessWidget {

  const StudentProfile_Screen({Key? key,required this.singleObj}) : super(key: key);
  final UserModel singleObj;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // resizeToAvoidBottomInset: false,
      appBar: myHeader(),
      body: buildFetchObj(singleObj),
    );
  }

  

  buildFetchObj(modelObj) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(
                    'https://www.pngitem.com/pimgs/m/22-223968_default-profile-picture-circle-hd-png-download.png'),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.account_box_rounded,
                      ),
                      Text("Name: ",
                          style: TextStyle(fontSize: 20, color: Colors.black)),
                      Text(modelObj.first_name + " " + modelObj.last_name,
                          style:
                              TextStyle(fontSize: 20, color: Colors.black54)),
                    ],
                  ),
                ),
                // Text(""+modelObj.last_name),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.confirmation_number_rounded,
                      ),
                      Text("ID No: ",
                          style: TextStyle(fontSize: 20, color: Colors.black)),
                      Text(modelObj.roll_no,
                          style:
                              TextStyle(fontSize: 20, color: Colors.black54)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.class_,
                      ),
                      Text("Class: ",
                          style: TextStyle(fontSize: 20, color: Colors.black)),
                      Text(modelObj.class_name,
                          style:
                              TextStyle(fontSize: 20, color: Colors.black54)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.email,
                      ),
                      Text("Email: ",
                          style: TextStyle(fontSize: 20, color: Colors.black)),
                      Text(modelObj.email,
                          style:
                              TextStyle(fontSize: 18, color: Colors.black54)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  connectionErrorText(error) {
    return Center(
      child: Text(
        'Connection error or \n Error: $error',
        style: TextStyle(color: Colors.red),
      ),
    );
  }

  AppBar myHeader() {
    return AppBar(
      backgroundColor: Colors.red,
      centerTitle: true,
      // elevation: 0.0,
      // leading: IconButton(
      //     icon: Icon(
      //       Icons.arrow_back,
      //       color: Colors.black,
      //     ),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     }),
      // automaticallyImplyLeading: true,  //removes default back arrow on appbar

      title: Text(
        "${singleObj.first_name}'s ID", //give here appBar title
        style: TextStyle(color: Colors.black
            // fontWeight: FontWeight.bold
            // fontSize: 15,
            ),
      ),
      actions: [
        BlocConsumer<LogoutBloc, LogoutState>(
          listener: (context, state) {
            // TODO: implement listener
            if (state is LogoutLoaded_state) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return SplashScreen();
              }));
            } else if (state is LogoutError_state) {
              mySnackBar(context: context, textArg: "Couldn't Log Out");
            }
          },
          builder: (context, state) {
            if (state is LogoutLoading_state) {
              return CircularProgressIndicator();
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  onPressed: () {
                    BlocProvider.of<LogoutBloc>(context)
                        .add(Logout_button_click_event());
                  },
                  icon: Icon(
                    Icons.logout_rounded,
                    color: Colors.black,
                  )),
            );
          },
        )
      ],
    );
  }

  mySnackBar({required context, required textArg, bool isFloating = false}) {
    if (isFloating == false) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text(textArg),
        ),
      );
    } else if (isFloating == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.green,
          content: Text(textArg),
        ),
      );
    }
  }
}
  