import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;

  LoginFormData formData = LoginFormData();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
            key: _formKey,
            autovalidateMode: _autoValidate,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    validator: (value) {
                      final emailExp = RegExp(r'^[A-Za-z0-9.-@]+$');
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      } else if (!emailExp.hasMatch(value)) {
                        return 'Wrong characters';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      formData.email = value ?? "";
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Saved!')));
                      } else {
                        _autoValidate = AutovalidateMode.always;
                      }
                    },
                    child: const Text('Submit'),
                  )
                ],
              ),
            )));
  }
}

class LoginFormData {
  String email = "";
}
