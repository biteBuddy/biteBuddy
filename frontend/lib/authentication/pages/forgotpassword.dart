import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frontend/ApiSerives/user.dart';
import 'package:frontend/authentication/pages/login.dart';
import 'package:frontend/common/theme.dart';
import 'otp.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  static const String _title = 'Forgot Password';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   leading: BackButton(
        //     onPressed: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(builder: (context) => const LoginPage()),
        //       );
        //     },
        //   ),
        //   title: const Text(_title),
        //   backgroundColor: const Color.fromARGB(100, 64, 185, 60),
        // ),
        body: const ForgotPasswordPageWidget(),
      ),
    );
  }
}

class ForgotPasswordPageWidget extends StatefulWidget {
  const ForgotPasswordPageWidget({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPageWidget> createState() =>
      _ForgotPasswordPageWidgetState();
}

class _ForgotPasswordPageWidgetState extends State<ForgotPasswordPageWidget> {
  TextEditingController emailController = TextEditingController();

  @override
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
              'Forgot Your Password?',
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
              controller: emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Email Address',
              ),
            ),
          ),
          Container(
            height: 58,
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: CustomTheme().primaryColor1),
              child: const Text('Send OTP to email'),
              onPressed: () async {
                try {
                  print(emailController.text);
                  var value =
                      await UserAPI().forgotPassword(emailController.text);

                  if (value) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OtpPage(
                                email: emailController.text,
                              )),
                    );
                  }
                } catch (e) {
                  Fluttertoast.showToast(msg: "Error Occured");
                }
              },
            ),
          ),
          Container(
              height: 58,
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomTheme().primaryColor1,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  },
                  child: const Text("Go Back")))
        ],
      ),
    );
  }
}
