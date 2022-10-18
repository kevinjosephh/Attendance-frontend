import 'package:flutter/material.dart';

import 'Class_register_form/Class_register_delete_button.dart';
import 'Class_register_form/Class_register_form_widget.dart';

/* -------------------------------------------------------------------------- */
/*                               //@ Stateful                                 */
/* -------------------------------------------------------------------------- */

class Class_register_screen extends StatefulWidget {
  final singleObj;

  Class_register_screen({this.singleObj});
  Class_register_screen.named(this.singleObj);

  @override
  _Class_register_screenState createState() => _Class_register_screenState();
}

/* -------------------------------------------------------------------------- */
/*                               //@ State class                              */
/* -------------------------------------------------------------------------- */

class _Class_register_screenState extends State<Class_register_screen> {
  //* Declaration
  final formKey1 = GlobalKey<FormState>();
  DateTime myDate =  DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

/* -------------------------------------------------------------------------- */
/*                             //@ Controllers                                */
/* -------------------------------------------------------------------------- */

  // create controllers here
  TextEditingController nameController = TextEditingController();
  TextEditingController start_dateController = TextEditingController();
  TextEditingController end_dateController = TextEditingController();
/* -------------------------------------------------------------------------- */
/*                           //! Life cycle methods                           */
/* -------------------------------------------------------------------------- */

  @override
  void initState() {
    super.initState();
    if (widget.singleObj == null) {
      //pass all the controllers here
      nameController.text;
      start_dateController.text;
      end_dateController.text;

      // assign controller to model props
    } else {
      nameController.text = widget.singleObj!.name;
      start_dateController.text = widget.singleObj!.start_date;
      end_dateController.text = widget.singleObj!.end_date;
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
          // Padding(
          //   padding: const EdgeInsets.all(20.0),
          //   child: Image.asset('images/index.png'),
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Class_register_form_widget(
              singleObj: widget.singleObj,
              formKey: formKey1,
              name: nameController,
              start_date: start_dateController,
              end_date: end_dateController,
            ),
          ),
          // showMyDatePicker() ,
          // Text("${myDate.day}-${myDate.month}-${myDate.year}"),
        ],
      ),
    );
  }
  // Todo :paste this line in class declaration, then comment it
// DateTime myDate =  DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);


//Todo: Just paste this function outside build method , and later call it in build method : 
showMyendDatePicker() {
    return TextButton(
      child: Text('pick start date'),
   onPressed: () async {
        DateTime? myNewDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime(2200));
        if (myNewDate == null) return;
        setState(() {
          // isDateEntered = true;
          myDate = myNewDate;
        });   },   );    }
showMyDatePicker() {
    return TextButton(
      child: Text('pick start date'),
   onPressed: () async {
        DateTime? myNewDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime(2200));
        if (myNewDate == null) return;
        setState(() {
          // isDateEntered = true;
          myDate = myNewDate;
        });   },   );    }

  pickDateCard() {
    var dimVar = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () async {
        DateTime? myNewDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime(2200));

        if (myNewDate == null) return;
        setState(() {
          // isDateEntered = true;
          myDate = myNewDate;
          // BlocProvider.of<AttendanceFetchPropBloc>(context).add(
          //     Attendance_FetchProp_onInit_Event(
          //         '&recordDate=${myDate.day}-${myDate.month}-${myDate.year}'));
          // print('&recordDate=${myDate.day}-${myDate.month}-${myDate.year}');
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          // height: dimVar.height * 0.08,
          width: dimVar.width,
          child: Card(
            elevation: 10,
            color: Colors.red,
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.blue,
                Colors.purpleAccent,
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 15, 8.0, 15),
                    child: Text(
                      "Pick a date from here",
                      // maxLines: 2,
                      // overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        // decoration: TextDecoration.none,
                        // fontStyle: FontStyle.italic,
                        // fontFamily: "FontNameHere" ,
                        fontWeight: FontWeight.bold,
                        // fontWeight: FontWeight.w300,
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
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
            : "ADD CLASS", //give here appBar title
        style: TextStyle(
          color: Color.fromARGB(255, 8, 40, 75),
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
      // actions: [
      //   //! Delete button
      //   widget.singleObj != null
      //       ? Class_register_delete_button(
      //           singleObj: widget.singleObj,
      //         )
      //       : Text('')
      // ],
    );
  }
}
