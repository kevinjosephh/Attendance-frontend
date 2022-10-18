import 'package:attendance/screens/ATTENDANCE/QR_codeBox_screen.dart';
import 'package:attendance/screens/ATTENDANCE/Qr_scanner_screens/Qr_scanner_screen.dart';
import 'package:attendance/screens/Home/HomeScreen.dart';
import 'package:attendance/screens/Profile/studentProfile_fetch_id_screen.dart';
import 'package:flutter/material.dart';

import '../Home/__Home_screen__/student_HomeScreen.dart';

class BottomNavigationStudentScreen extends StatefulWidget {
  const BottomNavigationStudentScreen({super.key});

  @override
  State<BottomNavigationStudentScreen> createState() => _BottomNavigationStudentScreenState();
}

class _BottomNavigationStudentScreenState extends State<BottomNavigationStudentScreen> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    Widget child = Container();

    switch (_index) {
      case 0:
        child = StudentProfile_FetchId_Screen();
        break;

      case 1:
        child = StudentHomeScreen();
        break;
      case 2:
        child = Qr_scanner_screen();
        break;
      // case 3:
      //   child = Qr_scanner_screen();
      //   break;
    }

    return Scaffold(
      // appBar: AppBar(),
      bottomNavigationBar: _bottomTab(),
      body: SizedBox.expand(child: child),
    );
  }

  Widget _bottomTab() {
    return BottomNavigationBar(
      currentIndex: _index,
      onTap: (int index) => setState(() => _index = index),
      // backgroundColor: Colors.deepPurple,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.supervised_user_circle),
          label: 'ID CARD',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'HOME',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.document_scanner_rounded ),
          label: 'QR Scan',
        ),
        // BottomNavigationStudentBarItem(
        //   icon: Icon(Icons.qr_code_scanner_rounded),
        //   label: 'Scanner',
        // ),
      ],
    );
  }
}
