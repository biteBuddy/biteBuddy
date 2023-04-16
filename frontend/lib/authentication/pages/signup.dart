import 'dart:convert';

import 'package:flutter/material.dart';

import 'login.dart';
import 'package:http/http.dart' as http;
import "config.dart";

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  static const String _title = 'Sample App';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        // appBar: AppBar(
        //   leading: BackButton(
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //   ),
        //   title: const Text("Sign Up",style:
        //                 TextStyle(fontFamily: "NanumPenScript", fontSize: 20),),
        //   backgroundColor: const Color.fromARGB(100, 64, 185, 60),
        // ),
        body: const SignupPageWidget(),
      ),
    );
  }
}

class SignupPageWidget extends StatefulWidget {
  const SignupPageWidget({Key? key}) : super(key: key);

  @override
  State<SignupPageWidget> createState() => _SignupPageWidgetState();
}

class _SignupPageWidgetState extends State<SignupPageWidget> {
  TextEditingController signupNameController = TextEditingController();
  TextEditingController signupEmailController = TextEditingController();
  TextEditingController signupPasswordController = TextEditingController();
  bool _isNotValid = false;

  void registerUser() async {
    if (signupEmailController.text.isNotEmpty &&
        signupPasswordController.text.isNotEmpty) {
      var regBody = {
        "email": signupEmailController.text,
        "password": signupPasswordController.text
      };

      var response = await http.post(Uri.parse(registration),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(regBody));

      var jsonResponse = jsonDecode(response.body);

      print(jsonResponse["status"]);
    } else {
      setState(() {
        _isNotValid = true;
      });
    }
  }

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
            child: Image.asset('assets/images/logo.png'),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Create your account',
              style: TextStyle(
                fontSize: 29,
                fontWeight: FontWeight.w400,
                fontFamily: 'NanumPenScript',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: signupNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Full Name',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: signupEmailController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Email Address',
                errorStyle: const TextStyle(color: Colors.red),
                errorText: _isNotValid ? "Enter correct email" : null,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              obscureText: true,
              controller: signupPasswordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
          Container(
            height: 68,
            padding: const EdgeInsets.fromLTRB(8, 18, 8, 0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 151, 196, 99),
              ),
              child: const Text('Sign up'),
              onPressed: () {
                registerUser();
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const LoginPage()),
                // );
                print(signupNameController.text);
                print(signupEmailController.text);
                print(signupPasswordController.text);
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Already have an account?',
                style: TextStyle(fontFamily: "NanumPenScript", fontSize: 22),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: const Color.fromARGB(210, 237, 63, 60),
                ),
                child: const Text(
                  'Sign in',
                  style: TextStyle(fontFamily: "NanumPenScript", fontSize: 22),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
