import 'package:flutter/material.dart';
import 'package:frontend/authentication/pages/forgotpassword.dart';
import 'package:frontend/authentication/pages/signup.dart';
import '../../pages/bottomNav.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
        //   title: const Text(""),
        //   backgroundColor:  Color(0xFFD2FBA4),
        // ),
        body: Builder(
          builder: (context) => Padding(
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
                  child: const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: const TextField(
                    obscureText: true,
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
                    style:
                        TextStyle(fontFamily: "NanumPenScript", fontSize: 20),
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
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NavigationPage(),
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Don\'t have an Account?',
                      style:
                          TextStyle(fontSize: 20, fontFamily: "NanumPenScript"),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: const Color.fromARGB(210, 237, 63, 60),
                      ),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 22, fontFamily: "NanumPenScript"),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
