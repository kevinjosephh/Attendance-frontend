import 'package:attendance/Logic/SplashLogic/splash_bloc.dart';
import 'package:attendance/screens/BottomNavigation/BottomNavigationTeacherScreen.dart';
import 'package:attendance/screens/Login/__User_cud_screen__/User_cud_screen.dart';
import 'package:attendance/screens/Profile/studentProfile_fetch_id_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../BottomNavigation/BottomNavgivationStudentScreen.dart';
import '../../BottomNavigation/BottomNavigationAdminScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    blocFunc();
    // BlocProvider.of<SplashBloc>(context).add(Check_role_event());
  }
  blocFunc() {
    Future.delayed(Duration(milliseconds: 2000), () {
      BlocProvider.of<SplashBloc>(context).add(Check_role_event());
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        // TODO: implement listener
        print(state);
        if (state is Role_is_student_state){
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            // return BottomNavigationScreen();
            return BottomNavigationStudentScreen() ;
          }));
        } else if(state is Role_is_teacher_state){
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return BottomNavigationTeacherScreen() ;
          }));
        } else if(state is Role_is_admin_state){
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return BottomNavigationAdminScreen() ;
          }
          ));
        } else {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return User_cud_screen();
          }
          ));
        }
      },
      child: Splash_ui()
    );
    
  }
  Splash_ui(){
    return Container(
      color: Colors.amberAccent,
    );
  }
}
