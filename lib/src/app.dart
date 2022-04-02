import 'package:flutter/material.dart';
import 'package:form_validation_statefulwidget/src/screens/login_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Log me in',
      home: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}
