import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Logic/teacher_register_logic/teacher_register_bloc.dart';
import '../../../../Logic/user_register_logic/user_register_bloc.dart';
import '../../../Components/myComponents.dart';

class Teacher_register_update_button extends StatelessWidget {
  final singleObj;
  final formKey;
  const Teacher_register_update_button(
      {super.key, required this.formKey, required this.singleObj});

  @override
  Widget build(BuildContext context) {
    return updateButton_STATES();
  }

/* -------------------------------------------------------------------------- */
/*                                 //@ States                                 */
/* -------------------------------------------------------------------------- */

  updateButton_STATES() {
    return BlocConsumer<TeacherRegisterBloc, TeacherRegisterState>(
      listener: (context, state) {
        if (state is Teacher_update_Loaded_State) {
          MyComponents.successSnackBar(context, 'Action completed');
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        //default state
        if (state is TeacherRegisterInitial) {
          return update_Button_ui(context);
        } else if (state is Teacher_update_Loading_State) {
          return customLoading();
        } else if (state is Teacher_update_Error_State) {
          return errorWidget(context, state);
        }

        //! extra states
        else if (state is Teacher_create_Loading_State ||
            state is Teacher_Delete_Loading_state) {
          return Text('Please wait .....');
        }

        // if any other state (which is not mentioned)
        return update_Button_ui(context);
      },
    );
  }

/* -------------------------------------------------------------------------- */
/*                                 //@ widgets                                */
/* -------------------------------------------------------------------------- */
  update_Button_ui(context) {
    return TextButton(
      child: Text(
        "Update",
        style: TextStyle(color: Colors.white),
      ),
      style: TextButton.styleFrom(backgroundColor: Colors.deepPurple),
      onPressed: () async => update_FUNC(context),
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
          update_Button_ui(context),
        ],
      ),
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //@ Functionalities                            */
/* -------------------------------------------------------------------------- */

  update_FUNC(context) {
    // if (formKey.currentState!.validate()) {
    //   // create diff obj to update ( with id )or else , to much error

    //   User modelObjToUpdate = User(
    //       id: singleObj!.id,
    //       todo: todoContoller.text,
    //       description: descriptionController.text);

    //   BlocProvider.of<TeacherRegisterBloc>(context).add(
    //       Teacher_Update_onButtonPressed_Event(modelObjToUpdate, singleObj!.id));
  }
}
