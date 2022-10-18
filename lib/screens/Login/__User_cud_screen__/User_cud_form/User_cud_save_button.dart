
import 'package:attendance/screens/Profile/studentProfile_fetch_id_screen.dart';
import 'package:attendance/service_layer/models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Logic/user_cud_logic/user_cud_bloc.dart';
import '../../../Components/myComponents.dart';
import '../../../Splash/__splash_screen__/Splash_screen.dart';

class User_cud_save_button extends StatelessWidget {
  final singleObj;
  final formKey;
  final email;
  final passnumber;
  const User_cud_save_button(
      {super.key, required this.formKey, required this.singleObj, required this.email, required this.passnumber });

  @override
  Widget build(BuildContext context) {
    return saveButton_STATES();
  }

/* -------------------------------------------------------------------------- */
/*                                 //@ States                                 */
/* -------------------------------------------------------------------------- */

  saveButton_STATES() {
    return BlocConsumer<UserCudBloc, UserCudState>(
      listener: (context, state) {
        if (state is User_create_Loaded_State) {
          MyComponents.successSnackBar(context, 'Action completed');
          // Navigator.pop(context);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return SplashScreen();
        })) ;
        } else if(state is User_create_doesnot_exsit_State){
          MyComponents.errorSnackBar(context, state.error);
        }
      },
      builder: (context, state) {
        //default state
        if (state is UserCudInitial) {
          return save_Button_ui(context);
        } else if (state is User_create_Loading_State) {
          return customLoading();
        } else if (state is User_create_Error_State) {
          return errorWidget(context, state);
        }

        //! extra states
        else if (state is User_update_Loading_State ||
            state is User_Delete_Loading_state) {
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
            "LOGIN",
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
      UserModel user_model = UserModel(email: email.text ,password: passnumber.text);
      //
      BlocProvider.of<UserCudBloc>(context)
          .add(User_create_onButtonPressed_Event(user_model));
    }
  }
}
