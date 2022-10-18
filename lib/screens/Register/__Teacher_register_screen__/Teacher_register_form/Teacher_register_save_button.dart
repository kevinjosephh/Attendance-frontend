import 'package:attendance/screens/Profile/studentProfile_fetch_id_screen.dart';
import 'package:attendance/service_layer/models/UserModelV2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Logic/teacher_register_logic/teacher_register_bloc.dart';
import '../../../../Logic/user_register_logic/user_register_bloc.dart';
import '../../../Components/myComponents.dart';

class Teacher_register_save_button extends StatelessWidget {
  final singleObj;
  final formKey;
  final firstName;
  final lastName;
  // final role;
  final rollNo;
  final className;
  final email;
  final passnumber;
  const Teacher_register_save_button(
      {super.key,
      required this.formKey,
      required this.singleObj,
      required this.firstName,
      required this.lastName,
      // required this.role,
      required this.rollNo,
      required this.className,
      required this.email,
      required this.passnumber});

  @override
  Widget build(BuildContext context) {
    return saveButton_STATES();
  }

/* -------------------------------------------------------------------------- */
/*                                 //@ States                                 */
/* -------------------------------------------------------------------------- */

  saveButton_STATES() {
    return BlocConsumer<TeacherRegisterBloc, TeacherRegisterState>(
      listener: (context, state) {
        if (state is Teacher_create_Loaded_State) {
          MyComponents.successSnackBar(context, 'Action completed');
          Navigator.pop(context);
          //   Navigator.push(context, MaterialPageRoute(builder: (context) {
          //   return StudentProfile_FetchId_Screen() ;
          // })) ;
        } else if (state is Teacher_create_doesnot_exsit_State) {
          MyComponents.errorSnackBar(context, state.error);
        }
      },
      builder: (context, state) {
        //default state
        if (state is TeacherRegisterInitial) {
          return save_Button_ui(context);
        } else if (state is Teacher_create_Loading_State) {
          return customLoading();
        } else if (state is Teacher_create_Error_State) {
          return errorWidget(context, state);
        }

        //! extra states
        else if (state is Teacher_update_Loading_State ||
            state is Teacher_Delete_Loading_state) {
          return Text('Please wait .....');
        }

        // if any other state (which is not mentioned)
        return save_Button_ui(context);
      },
    );
  }

/* -------------------------------------------------------------------------- */
/*                                 //@ Widgets                                */
/* -------------------------------------------------------------------------- */

  save_Button_ui(context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextButton(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "ADD",
            style: TextStyle(color: Colors.white),
          ),
        ),
        style: TextButton.styleFrom(backgroundColor: Colors.deepPurple),
        onPressed: () async => save_FUNC(context),
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //@ Static widgets                             */
/* -------------------------------------------------------------------------- */

  customLoading() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        // mainAxisAlignment: MainAxisAlignment.center,

        children: [
          MyComponents.buildLoading(),
          Text('Please wait ...'),
        ],
      ),
    );
  }

  errorWidget(context, state) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Error : ${state.error}'),
          save_Button_ui(context),
        ],
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //@ Functionalities                            */
/* -------------------------------------------------------------------------- */

  save_FUNC(context) {
    if (formKey.currentState!.validate()) {
      // make model obj here to add
      UserModelV2 user_model = UserModelV2(
          firstName: firstName.text,
          lastName: lastName.text,
          // role: role.text,
          rollNo: rollNo.text,
          className: className.text,
          email: email.text,
          password: passnumber.text);
      //
      BlocProvider.of<TeacherRegisterBloc>(context)
          .add(Teacher_create_onButtonPressed_Event(user_model));
    }
  }
}
