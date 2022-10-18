import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../repo_layer/User_repo.dart';
import '../../service_layer/models/UserModel.dart';

//to change class name = right click on className> Rename symbol
class QR_codeBox extends StatefulWidget {
  const QR_codeBox({Key? key}) : super(key: key);

  @override
  _QR_codeBoxState createState() => _QR_codeBoxState();
}

class _QR_codeBoxState extends State<QR_codeBox> {

  get_user_class() {
    User_sp_repo user_sp_repo = User_sp_repo();
    UserModel user = user_sp_repo.get_model_user('user');
    return user.class_name;
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // resizeToAvoidBottomInset: false,
        appBar: myHeader(),
        body: myBody());
  }

  myQRCode() {
    var QR_text = get_user_class();
    return QrImage(
      data: QR_text,
      size: 200,
      backgroundColor: Colors.white,
    );
  }

  myBody() {
    var QR_text = get_user_class();
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //! SHow QR code box
        Center(child: myQRCode()),
        SizedBox(
          height: 40,
        ),

        //! Show QR code name
        Text(
          QR_text,
          // maxLines: 2,
          // overflow: TextOverflow.ellipsis,
          // textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.blue,
            // decoration: TextDecoration.none,
            // fontStyle: FontStyle.italic,
            // fontFamily: "FontNameHere" ,
            fontWeight: FontWeight.bold,
            // fontWeight: FontWeight.w300,
            fontSize: 40.0,
          ),
        ),

        //! Extra text note
        Text(
          "Show this QR code to your class \nso that students can mark their \nattendance by scanning this",
          // maxLines: 2,
          // overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            // decoration: TextDecoration.none,
            // fontStyle: FontStyle.italic,
            // fontFamily: "FontNameHere" ,
            fontWeight: FontWeight.bold,
            // fontWeight: FontWeight.w300,
            fontSize: 15.0,
          ),
        ),
      ],
    );
  }

  AppBar myHeader() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        "Scan QR", //give here appBar title
        style: TextStyle(color: Colors.black
            // fontWeight: FontWeight.bold
            // fontSize: 15,
            ),
      ),
    );
  }
}
