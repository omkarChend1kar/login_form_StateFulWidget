import 'package:flutter/material.dart';
import 'package:form_validation_statefulwidget/src/mixins/validation_mixins.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValdiationMixin {
  //Adding Referencing a Global key of type formState to the variable formkey
  //Adding variable of type Global key which gives reference to any class instantiated
  final formkey = GlobalKey<FormState>();
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Form(
            //Giving direct reference to the FormState to access it
            key: formkey,
            child: Column(
              children: [
                emailField(),
                Container(margin: EdgeInsets.only(bottom: 25)),
                passwordField(),
                Container(margin: EdgeInsets.only(bottom: 20)),
                LogInButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'yourId@example.com',
        fillColor: Color.fromARGB(252, 182, 182, 182),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Color.fromARGB(174, 92, 92, 92),
              width: 2.5,
            )),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
              color: Color.fromARGB(174, 92, 92, 92),
              width: 2.5,
            )),
      ),
      validator: validateEmail,
      onSaved: (value) {
        email = value!;
        //To check whether it retrievs the data
        print(value);
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      validator: validatePassword,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter six digit password',
        fillColor: Color.fromARGB(252, 182, 182, 182),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Color.fromARGB(174, 92, 92, 92),
              width: 2.5,
            )),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
              color: Color.fromARGB(174, 92, 92, 92),
              width: 2.5,
            )),
      ),
      obscureText: true,
      onSaved: (value) {
        password = value!;
        print(value);
      },
    );
  }

  Widget LogInButton() {
    // ignore: prefer_const_constructors
    return SizedBox(
      width: 270,
      height: 40,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black),
            textStyle: MaterialStateProperty.all(
              TextStyle(fontSize: 20),
            )),
        onPressed: () {
          //To reset the formState.
          // formkey.currentState?.reset();
          //To validate the form.
          bool? isValid = formkey.currentState?.validate();
          if (isValid!) {
            formkey.currentState?.save();
          }
        },
        child: Text('Login'),
      ),
    );
  }
}
