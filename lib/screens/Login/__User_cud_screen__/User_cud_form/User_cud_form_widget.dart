import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'User_cud_save_button.dart';
import 'User_cud_update_button.dart';

class User_cud_form_widget extends StatelessWidget {
  final singleObj;
  final formKey;
  final kevin;
  final password;
  const User_cud_form_widget({
    super.key,
    required this.singleObj,
    required this.formKey,
    required this.kevin,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return formWidget(context);
  }

/* -------------------------------------------------------------------------- */
/*                            //@ Form widget                                 */
/* -------------------------------------------------------------------------- */

  formWidget(context) {
    var dimVar = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        color: Color.fromARGB(255, 229, 229, 229),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                all_textFormFields(context),
                singleObj == null
                    ? User_cud_save_button(
                        formKey: formKey,
                        singleObj: singleObj,
                        email: kevin,
                        passnumber: password,
                      )
                    : User_cud_update_button(
                        formKey: formKey,
                        singleObj: singleObj,
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }

  all_textFormFields(context) {
    var dimVar = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        // MyComponents.buildTextField();  //* use template if needed

        //* first field
        TextFormField(
          controller: kevin ,
          keyboardType: TextInputType.multiline,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Field required'; //if empty give error msg here
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: "Enter your email", //hint text here
          ),
        ),
        SizedBox(
          height: dimVar.height * 0.04,
        ),
        TextFormField(
          controller: password ,
          keyboardType: TextInputType.multiline,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Field required'; //if empty give error msg here
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: "Enter your password", //hint text here
          ),
        ),
      ],
    );
  }
}
