import 'package:flutter/material.dart';
import 'package:frontend/ApiSerives/token.dart';
import 'package:frontend/authentication/pages/forgotpassword.dart';
import 'package:frontend/authentication/pages/signup.dart';
import 'package:frontend/common/theme.dart';
import '../../pages/bottomNav.dart';
import 'config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ChangePasswordPage extends StatelessWidget {
  ChangePasswordPage({Key? key, required this.email}) : super(key: key);
  String email;
  static const String _title = 'Sample App';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
          appBar: AppBar(
            leading: BackButton(
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
          body: ChangePasswordPageWidget(
            email: email,
          )),
    );
  }
}

class ChangePasswordPageWidget extends StatefulWidget {
  ChangePasswordPageWidget({Key? key, required this.email}) : super(key: key);
  String email;
  @override
  State<ChangePasswordPageWidget> createState() =>
      _ChangePasswordPageWidgetState();
}

class _ChangePasswordPageWidgetState extends State<ChangePasswordPageWidget> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  var token = Token();
  Future<void> changePassword() async {
    if (newPasswordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty) {
      if (newPasswordController.text != confirmPasswordController.text) {
        Fluttertoast.showToast(msg: "Passwords don't match!");
        return;
      }
      var logBody = {
        "newPassword": newPasswordController.text,
        "email": widget.email
      };
      var token1 = await token.storage.read(key: "jwt");
      var response = await http.post(
          Uri.parse("http://localhost:3000/api/v1/user/changePassword"),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(logBody));
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['success'] == true) {
        Fluttertoast.showToast(msg: "Password changed successfully!");

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: ((context) => SignupPage())));
      } else {
        Fluttertoast.showToast(msg: "Error changing password!");
      }
    } else {
      Fluttertoast.showToast(msg: "Please enter all fields!");
    }
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
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
              'Change Password',
              style: TextStyle(
                fontSize: 29,
                fontWeight: FontWeight.bold,
                fontFamily: 'NanumPenScript',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              obscureText: true,
              controller: newPasswordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'New Password',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              obscureText: true,
              controller: confirmPasswordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Confirm Password',
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              changePassword();
            },
            style: TextButton.styleFrom(
              foregroundColor: const Color.fromARGB(200, 237, 63, 60),
            ),
            child: const Text(
              'Change Password',
              style: TextStyle(fontFamily: "NanumPenScript", fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
