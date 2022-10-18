import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Class_register_save_button.dart';
import 'Class_register_update_button.dart';

class Class_register_form_widget extends StatelessWidget {
  final singleObj;
  final formKey;
  final name;
  final start_date;
  final end_date;

  const Class_register_form_widget({
    super.key,
    required this.singleObj,
    required this.formKey,
    required this.name,
    required this.start_date,
    required this.end_date,
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
                    ? Class_register_save_button(
                        formKey: formKey,
                        singleObj: singleObj,
                        name: name,
                        start_date: start_date,
                        end_date: end_date,
                      )
                    : Class_register_update_button(
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
          controller: name,
          keyboardType: TextInputType.multiline,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Field required'; //if empty give error msg here
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: "Name", //hint text here
          ),
        ),
        TextFormField(
          controller: start_date,
          keyboardType: TextInputType.multiline,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Field required'; //if empty give error msg here
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: "Start Date", //hint text here
          ),
        ),
        TextFormField(
          controller: end_date,
          keyboardType: TextInputType.multiline,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Field required'; //if empty give error msg here
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: "End date  ", //hint text here
          ),
        ),
      ],
    );
  }
}
