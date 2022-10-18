import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'User_register_save_button.dart';
import 'User_register_update_button.dart';

class User_register_form_widget extends StatelessWidget {
  final singleObj;
  final formKey;
  final firstName;
  final lastName;
  // final role;
  final rollNo;
  final className;
  final kevin;
  final password;

  const User_register_form_widget({
    super.key,
    required this.singleObj,
    required this.formKey,
    required this.firstName,
    required this.lastName,
    // required this.role,
    required this.rollNo,
    required this.className,
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
                    ? User_register_save_button(
                        formKey: formKey,
                        singleObj: singleObj,
                        firstName: firstName,
                        lastName: lastName,
                        // role: role,
                        rollNo: rollNo,
                        className: className,
                        email: kevin,
                        passnumber: password,
                      )
                    : User_register_update_button(
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
          controller: firstName,
          keyboardType: TextInputType.multiline,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Field required'; //if empty give error msg here
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: "First Name", //hint text here
          ),
        ),
        TextFormField(
          controller: lastName,
          keyboardType: TextInputType.multiline,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Field required'; //if empty give error msg here
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: "Last Name", //hint text here
          ),
        ),
        // TextFormField(
        //   // controller: role ,
        //   keyboardType: TextInputType.multiline,
        //   validator: (value) {
        //     if (value == null || value.isEmpty) {
        //       return 'Field required'; //if empty give error msg here
        //     }
        //     return null;
        //   },
        //   decoration: InputDecoration(
        //     labelText: "Role  ", //hint text here
        //   ),
        // ),
        TextFormField(
          controller: rollNo,
          keyboardType: TextInputType.multiline,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Field required'; //if empty give error msg here
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: "Roll No", //hint text here
          ),
        ),
        TextFormField(
          controller: className,
          keyboardType: TextInputType.multiline,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Field required'; //if empty give error msg here
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: "Class Name", //hint text here
          ),
        ),

        TextFormField(
          controller: kevin,
          keyboardType: TextInputType.multiline,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Field required'; //if empty give error msg here
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: "Email", //hint text here
          ),
        ),
        SizedBox(
          height: dimVar.height * 0.04,
        ),
        TextFormField(
          controller: password,
          keyboardType: TextInputType.multiline,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Field required'; //if empty give error msg here
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: "Password", //hint text here
          ),
        ),
      ],
    );
  }
}
