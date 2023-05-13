import 'package:flutter/material.dart';
import 'package:frontend/ApiSerives/token.dart';
import 'package:frontend/authentication/pages/forgotpassword.dart';
import 'package:frontend/authentication/pages/signup.dart';
import '../../pages/bottomNav.dart';
import 'config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const String _title = 'Sample App';
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
          // appBar: AppBar(
          //   leading: BackButton(
          //     onPressed: () {
          //       Navigator.pop(context);
          //     },
          //   ),
          //   title: const Text(""),
          //   backgroundColor:  Color(0xFFD2FBA4),
          // ),
          body: LoginPageWidget()),
    );
  }
}

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({Key? key}) : super(key: key);
  @override
  State<LoginPageWidget> createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  late SharedPreferences prefs; //used in initSharedPref below
  @override
  void initState() {
    super.initState();
    initSharedPref();
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  void loginUser() async {
    if (loginEmailController.text.isNotEmpty &&
        loginPasswordController.text.isNotEmpty) {
      var logBody = {
        "email": loginEmailController.text,
        "password": loginPasswordController.text
      };
      var response = await http.post(
          Uri.parse("http://localhost:3000/api/v1/user/login"),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(logBody));
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['status'] == true) {
        var logToken = jsonResponse['token'];
        prefs.setString('token', logToken);
        await Token().setToken(logToken);
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => NavigationPage(
              token: logToken,
            ),
          ),
        );
      }
    } else {
      Fluttertoast.showToast(msg: "User doesn't exist!");
      print('error');
    }
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
      child: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            height: 200,
            padding: const EdgeInsets.all(10),
            child: Image.asset('assets/images/logo.png'),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Welcome Back!',
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
              controller: loginEmailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              obscureText: true,
              controller: loginPasswordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const ForgotPasswordPage(),
                ),
              );
            },
            style: TextButton.styleFrom(
              foregroundColor: const Color.fromARGB(200, 237, 63, 60),
            ),
            child: const Text(
              'Forgot Password?',
              style: TextStyle(fontFamily: "NanumPenScript", fontSize: 20),
            ),
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 151, 196, 99),
              ),
              child: const Text('Login'),
              onPressed: () {
                loginUser();
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Don\'t have an Account?',
                style: TextStyle(fontSize: 20, fontFamily: "NanumPenScript"),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: const Color.fromARGB(210, 237, 63, 60),
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 22, fontFamily: "NanumPenScript"),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignupPage(),
                    ),
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
