import 'package:flutter/material.dart';
import 'package:frontend/forgotpassword.dart';
import 'package:frontend/main.dart';
import 'package:frontend/pages/homePage.dart';
import 'package:frontend/signup.dart';
import './pages/bottomNav.dart';

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
          leading: BackButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyApp()),
              );
              ;
            },
          ),
          title: const Text("Login"),
          backgroundColor: const Color.fromARGB(100, 64, 185, 60),
        ),
        body: Builder(
          builder: (context) => Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  height: 150,
                  width: 150,
                  padding: const EdgeInsets.all(10),
                  child: Image.asset('assets/logo.png'),
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
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
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
                        builder: (context) => const ForgotPasswordPage(),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: const Color.fromARGB(200, 237, 63, 60),
                  ),
                  child: const Text(
                    'Forgot Password?',
                  ),
                ),
                Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(100, 64, 185, 60),
                    ),
                    child: const Text('Login'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NavigationPage(),
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  children: <Widget>[
                    const Text('Don\'t have an Account?'),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: const Color.fromARGB(210, 237, 63, 60),
                      ),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 17),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupPage(),
                          ),
                        );
                      },
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
