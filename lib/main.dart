import 'package:attendance/Logic/Logout_logic/logout_bloc.dart';
import 'package:attendance/Logic/SplashLogic/splash_bloc.dart';
import 'package:attendance/Logic/StudentProfile_fetch_id_logic/studentProfile_fetch_id_bloc.dart';
import 'package:attendance/Logic/Teacher_fetch_logic/Teacher_fetch_bloc.dart';
import 'package:attendance/Logic/___Attendance___/attendance_create_logic/attendance_create_bloc.dart';
import 'package:attendance/Logic/___Attendance___/qr_scan_result_logic/qr_scan_result_bloc.dart';
import 'package:attendance/Logic/class_register_logic/class_register_bloc.dart';
import 'package:attendance/Logic/teacher_register_logic/teacher_register_bloc.dart';
import 'package:attendance/Logic/user_cud_logic/user_cud_bloc.dart';
import 'package:attendance/Logic/user_register_logic/user_register_bloc.dart';
import 'package:attendance/screens/ATTENDANCE/QR_codeBox_screen.dart';
import 'package:attendance/screens/BottomNavigation/BottomNavigationTeacherScreen.dart';
import 'package:attendance/screens/Home/__Home_screen__/student_HomeScreen.dart';
import 'package:attendance/screens/Login/__User_cud_screen__/User_cud_screen.dart';
import 'package:attendance/screens/Profile/StudentProfile.dart';
import 'package:attendance/screens/Profile/studentProfile_fetch_id_screen.dart';
import 'package:attendance/screens/Register/__User_register_screen__/User_register_screen.dart';
import 'package:attendance/screens/__Student_fetch_screen__/Student_fetch_screen.dart';
import 'package:attendance/service_layer/services/SharedPreferences_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Logic/Courses_fetch_logic/Course_fetch_bloc.dart';
import 'Logic/Student_fetch_logic/Student_fetch_bloc.dart';
import 'screens/Splash/__splash_screen__/Splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => StudentProfileFetchIdBloc(),
        ),
        BlocProvider(
          create: (context) => UserCudBloc(),
        ),
        BlocProvider(
          create: (context) => UserRegisterBloc(),
        ),
        BlocProvider(
          create: (context) => SplashBloc(),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(),
        ),
        BlocProvider(
          create: (context) => ClassRegisterBloc(),
        ),
        BlocProvider(
          create: (context) => StudentFetchBloc(),
        ),
        BlocProvider(
          create: (context) => AttendanceCreateBloc(),
        ),
        BlocProvider(
          create: (context) => QrScanResultBloc(),
        ),
        BlocProvider(
          create: (context) => CourseFetchBloc(),
        ),
        BlocProvider(
          create: (context) => TeacherRegisterBloc(),
        ),
        BlocProvider(
          create: (context) => TeacherFetchBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Attendance',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
