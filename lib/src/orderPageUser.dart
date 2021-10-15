import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:smart_select/smart_select.dart';

/**
 * Pagina donde se crear 
 */
class orderPageUser extends StatefulWidget {
  static String id = "orderPageUserUser";
  orderPageUser({Key key}) : super(key: key);

  @override
  _orderPageUserState createState() => _orderPageUserState();
}

final _formKey = GlobalKey<FormBuilderState>();

class _orderPageUserState extends State<orderPageUser> {
  var data;
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final _fbKey = GlobalKey<FormBuilderState>();

  var genderOptions = ['Opcion 1', 'Opcion 2', 'Opcion 3'];

  List<int> value = [2];
  List<S2Choice<int>> frameworks = [
    S2Choice<int>(value: 1, title: 'Cliente 1'),
    S2Choice<int>(value: 2, title: 'Cliente 2'),
    S2Choice<int>(value: 3, title: 'Cliente 3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[700],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                FormBuilder(
                    key: _fbKey,
                    initialValue: {
                      'date': DateTime.now(),
                      'accept_terms': false,
                    },
                    autovalidateMode: AutovalidateMode.always,
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text('Orden numero: 1'),
                            FormBuilderTextField(
                              name: 'text',
                              style: Theme.of(context).textTheme.body1,
                              validator: FormBuilderValidators.compose(
                                  [FormBuilderValidators.required(context)]),
                              decoration: InputDecoration(
                                  labelText: "Nombre de la orden"),
                            ),
                            FormBuilderDateTimePicker(
                              name: 'date',
                              // onChanged: _onChanged,
                              inputType: InputType.time,
                              decoration: InputDecoration(
                                labelText: 'Appointment Time',
                              ),
                              initialTime: TimeOfDay(hour: 8, minute: 0),
                              // initialValue: DateTime.now(),
                              // enabled: true,
                            ),
                            FormBuilderDateTimePicker(
                              name: 'date',
                              // onChanged: _onChanged,
                              inputType: InputType.date,
                              decoration: InputDecoration(
                                labelText: 'Fecha de inicio',
                              ),
                              initialTime: TimeOfDay(hour: 8, minute: 0),
                              // initialValue: DateTime.now(),
                              // enabled: true,
                            ),
                            SmartSelect<int>.multiple(
                              title: 'Selecionar Cliente',
                              value: value,
                              choiceItems: frameworks,
                              onChange: (state) =>
                                  setState(() => value = state.value),
                            ),
                            SmartSelect<int>.multiple(
                              title: 'Selecionar servicios',
                              value: value,
                              choiceItems: frameworks,
                              onChange: (state) =>
                                  setState(() => value = state.value),
                            ),
                            SmartSelect<int>.multiple(
                              title: 'Selecionar Personal',
                              value: value,
                              choiceItems: frameworks,
                              onChange: (state) =>
                                  setState(() => value = state.value),
                            ),
                            FormBuilderTextField(
                              name: 'text',
                              style: Theme.of(context).textTheme.body1,
                              validator: FormBuilderValidators.compose(
                                  [FormBuilderValidators.required(context)]),
                              decoration: InputDecoration(
                                  labelText: "Notas adicionales"),
                            ),
                            FormBuilderTextField(
                              name: 'text',
                              style: Theme.of(context).textTheme.body1,
                              validator: FormBuilderValidators.compose(
                                  [FormBuilderValidators.required(context)]),
                              decoration:
                                  InputDecoration(labelText: "Firma cliente"),
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: MaterialButton(
                                    color: Theme.of(context).accentColor,
                                    child: Text(
                                      "Terminado",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      _formKey.currentState.save();
                                      if (_formKey.currentState.validate()) {
                                        print(_formKey.currentState.value);
                                      } else {
                                        print("validation failed");
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(width: 20),
                                Expanded(
                                  child: MaterialButton(
                                    color: Theme.of(context).accentColor,
                                    child: Text(
                                      "Reset",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      _formKey.currentState.reset();
                                    },
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget createForm() {
    return Form(child: null);
  }
}
