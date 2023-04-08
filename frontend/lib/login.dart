// ignore_for_file: avoid_print, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:frontend/forgotpassword.dart';
import 'package:frontend/homepage.dart';
import 'package:frontend/signup.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const String _title = 'Sample App';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(""),
          backgroundColor: const Color.fromARGB(100, 64, 185, 60),
        ),
        body: const LoginPageWidget(),
      ),
    );
  }
}

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({Key? key}) : super(key: key);

  @override
  State<LoginPageWidget> createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  TextEditingController loginNameController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                height: 150,
                width: 150,
                padding: const EdgeInsets.all(10),
                child: Image.asset('assets/logo.png')),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Welcome Back!',
                  style: TextStyle(
                      fontSize: 29,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'NanumPenScript'),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: loginNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: false,
                controller: loginPasswordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ForgotPasswordPage()),
                );
              },
              style: TextButton.styleFrom(
                  foregroundColor: const Color.fromARGB(200, 237, 63, 60)),
              child: const Text(
                'Forgot Password?',
              ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(100, 64, 185, 60)),
                  child: const Text('Login'),
                  onPressed: () {
                    print(loginNameController.text);
                    print(loginPasswordController.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyHomePage()),
                    );
                  },
                )),
            Row(
              children: <Widget>[
                const Text('Don\'t have an Account?'),
                TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: const Color.fromARGB(210, 237, 63, 60)),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 17),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignupPage()),
                    );
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            )
          ],
        ));
  }
}
