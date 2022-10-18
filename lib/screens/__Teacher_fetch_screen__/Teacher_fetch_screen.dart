import 'package:attendance/Logic/user_register_logic/user_register_bloc.dart';

import '../../Logic/Teacher_fetch_logic/Teacher_fetch_bloc.dart';
import '../Register/__Teacher_register_screen__/Teacher_register_screen.dart';
import '../Register/__User_register_screen__/User_register_screen.dart';
import 'Teacher_fetch_fetchList/Teacher_fetch_belowList_widget.dart';
import 'Teacher_fetch_fetchList/Teacher_fetch_fetchList_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Teacher_Fetch_Screen extends StatefulWidget {
  const Teacher_Fetch_Screen({Key? key}) : super(key: key);

  @override
  _Teacher_Fetch_ScreenState createState() => _Teacher_Fetch_ScreenState();
}

/* -------------------------------------------------------------------------- */
/*                               //! State class                              */
/* -------------------------------------------------------------------------- */

class _Teacher_Fetch_ScreenState extends State<Teacher_Fetch_Screen> {
  final ScrollController scrollController = ScrollController();

/* -------------------------------------------------------------------------- */
/*                            //! lifecycle methods                           */
/* -------------------------------------------------------------------------- */

  @override
  void initState() {
    super.initState();

    //# a scroll listner which listens always
    scrollController.addListener(scrollListener);

    //# to call first set of pages
    BlocProvider.of<TeacherFetchBloc>(context)
        .add(Teacher_Fetch_onInit_Event());
  }

  @override
  void dispose() {
    scrollController.dispose();
    print('scroll controller disposed');
    super.dispose();
  }

  void scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      print('list endedddd');
      // Future.delayed(Duration(milliseconds: 100), () {
      //   BlocProvider.of<TeacherFetchBloc>(context).add(Teacher_Fetch_onInit_Event());
      // });
    }
  }

/* -------------------------------------------------------------------------- */
/*                              //! Build method                              */
/* -------------------------------------------------------------------------- */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // resizeToAvoidBottomInset: false,
      appBar: myHeader(),
      body: myBody_STATES(),
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //! body structure                             */
/* -------------------------------------------------------------------------- */

  myBody_STATES() {
    return BlocConsumer<UserRegisterBloc, UserRegisterState>(
      listener: (context, state) {
        if (state is User_create_Loaded_State
            // ||
            //     state is User_update_Loaded_State ||
            //     state is User_Delete_Loaded_state
            ) {
          onRefreshFunc();
        }
      },
      builder: (context, state) {
        return myBody();
      },
    );
  }

  myBody() {
    return RefreshIndicator(
      onRefresh: () async {
        print('Refreshed');
        onRefreshFunc();
      },
      child: SingleChildScrollView(
        //! note : make sure to pass controller in this list
        controller: scrollController,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              // fetch list
              Teacher_fetch_fetchList_widget(),

              // below fetch list
              Teacher_fetch_belowList_widget(
                scrollController: scrollController,
                scrollListener: scrollListener,
              ),

              //
            ]),
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                           //# Scaffold widgets                             */
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
        "Teachers", //give here appBar title
        style: TextStyle(
          color: Color.fromARGB(255, 8, 40, 75),
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
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Teacher_register_screen();
                }));
              },
              icon: Icon(
                Icons.add_circle_sharp,
                color: Colors.black,
              )),
        )
      ],
    );
  }

/* -------------------------------------------------------------------------- */
/*                         //# Sttic Helper functions                         */
/* -------------------------------------------------------------------------- */

  onRefreshFunc() {
    BlocProvider.of<TeacherFetchBloc>(context)
        .add(Teacher_Fetch_onRefresh_Event());
    BlocProvider.of<TeacherFetchBloc>(context)
        .add(Teacher_Fetch_onInit_Event());
    scrollController.addListener(scrollListener);
  }
}
