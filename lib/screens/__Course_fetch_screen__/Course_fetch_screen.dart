import 'package:attendance/Logic/user_register_logic/user_register_bloc.dart';

import '../../Logic/Courses_fetch_logic/Course_fetch_bloc.dart';
import '../Register/__Class_register_screen__/Class_register_screen.dart';
import '../Register/__User_register_screen__/User_register_screen.dart';
import 'Course_fetch_fetchList/Course_fetch_belowList_widget.dart';
import 'Course_fetch_fetchList/Course_fetch_fetchList_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Course_fetch_Screen extends StatefulWidget {
  const Course_fetch_Screen({Key? key}) : super(key: key);

  @override
  _Course_fetch_ScreenState createState() => _Course_fetch_ScreenState();
}

/* -------------------------------------------------------------------------- */
/*                               //! State class                              */
/* -------------------------------------------------------------------------- */

class _Course_fetch_ScreenState extends State<Course_fetch_Screen> {
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
    BlocProvider.of<CourseFetchBloc>(context).add(Course_Fetch_onInit_Event());
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
      //   BlocProvider.of<CourseFetchBloc>(context).add(Course_fetch_onInit_Event());
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
              Course_fetch_fetchList_widget(),

              // below fetch list
              Course_Fetch_belowList_widget(
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
        "Courses", //give here appBar title
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
                  return Class_register_screen();
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
    BlocProvider.of<CourseFetchBloc>(context)
        .add(Course_Fetch_onRefresh_Event());
    BlocProvider.of<CourseFetchBloc>(context).add(Course_Fetch_onInit_Event());
    scrollController.addListener(scrollListener);
  }
}
