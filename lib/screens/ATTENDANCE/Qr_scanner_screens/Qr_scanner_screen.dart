import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../Logic/___Attendance___/attendance_create_logic/attendance_create_bloc.dart';
import '../../../Logic/___Attendance___/qr_scan_result_logic/qr_scan_result_bloc.dart';
import 'Qr_overlay_component.dart';

//to change class name = right click on className> Rename symbol
class Qr_scanner_screen extends StatefulWidget {
  const Qr_scanner_screen({Key? key}) : super(key: key);

  @override
  _Qr_scanner_screenState createState() => _Qr_scanner_screenState();
}

class _Qr_scanner_screenState extends State<Qr_scanner_screen> {
  MobileScannerController cameraController = MobileScannerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // resizeToAvoidBottomInset: false,
      appBar: myHeader(),
      body: myStates(),
    );
  }

  myStates() {
    return BlocConsumer<QrScanResultBloc, QrScanResultState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is Qr_NOT_Detected_State) {
          return myBody();
        } else if (state is Qr_Detected_and_Right_State) {
          BlocProvider.of<AttendanceCreateBloc>(context)
              .add(Create_attendance_event());
          return detetedAndcreateAttendanceStates();
        } else if (state is Qr_Detected_and_Wrong_State) {
          return Center(child: Text('Wrong Qr scanned'));
        }
        return myBody();
      },
    );
  }

  myBody() {
    return Stack(
      children: [
        MobileScanner(
            allowDuplicates: false, // to pause after one detection
            controller: cameraController,
            onDetect: (barcode, args) {
              final String? code = barcode.rawValue;
              BlocProvider.of<QrScanResultBloc>(context)
                  .add(QrScan_onInit_Event(code));
            }),
        QRScannerOverlay(overlayColour: Colors.black.withOpacity(0.5)),
      ],
    );
  }

  detetedAndcreateAttendanceStates() {
    return BlocConsumer<AttendanceCreateBloc, AttendanceCreateState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is Attendance_loading_state) {
          return Center(child: CircularProgressIndicator());
        } 
        //else if (state is Attendance_error_state) {
        //   return Center(
        //     child: Text('Could not mark you present,\n '
        //         'Please try again later.\n'
        //         'Check you internet connection \n'
        //         ' (Error: ${state.error})'),
        //   );
        // } 
        else if (state is Attendance_success_state) {
          return Center(child: Text('You are marked present for today'));
        }
        else if (state is Attendance_already_done_state ) {
          return Center(child: Text('You are already marked'));
        }
        return Center(child: Text('Qr code scanned succesfully'));
      },
    );
  }

  AppBar myHeader() {
    return AppBar(
      backgroundColor: Colors.white,
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
        'Mobile scanner', //give here appBar title
        style: TextStyle(color: Colors.black
            // fontWeight: FontWeight.bold
            // fontSize: 15,
            ),
      ),
      actions: [
        IconButton(
          color: Colors.white,
          icon: ValueListenableBuilder(
            valueListenable: cameraController.torchState,
            builder: (context, state, child) {
              switch (state as TorchState) {
                case TorchState.off:
                  return const Icon(Icons.flash_off, color: Colors.grey);
                case TorchState.on:
                  return const Icon(Icons.flash_on, color: Colors.yellow);
              }
            },
          ),
          iconSize: 32.0,
          onPressed: () => cameraController.toggleTorch(),
        ),
        IconButton(
          color: Colors.white,
          icon: ValueListenableBuilder(
            valueListenable: cameraController.cameraFacingState,
            builder: (context, state, child) {
              switch (state as CameraFacing) {
                case CameraFacing.front:
                  return const Icon(
                    Icons.switch_camera,
                    color: Colors.greenAccent,
                  );
                case CameraFacing.back:
                  return const Icon(
                    Icons.switch_camera,
                    color: Colors.black,
                  );
              }
            },
          ),
          iconSize: 32.0,
          onPressed: () => cameraController.switchCamera(),
        ),
      ],
    );
  }
}
