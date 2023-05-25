import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frontend/authentication/pages/changepassword.dart';
import 'package:frontend/authentication/pages/forgotpassword.dart';

import 'dart:convert';
import '../../ApiSerives/token.dart';


class OtpPage extends StatelessWidget {
  const OtpPage({Key? key}) : super(key: key);

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
          body: OtpPageWidget()),
    );
  }
}

class OtpPageWidget extends StatefulWidget {
  const OtpPageWidget({Key? key}) : super(key: key);
  @override
  State<OtpPageWidget> createState() => _OtpPageWidgetState();
}

class _OtpPageWidgetState extends State<OtpPageWidget> {
  final TextEditingController _otpController1 = TextEditingController();
  final TextEditingController _otpController2 = TextEditingController();

  final TextEditingController _otpController3 = TextEditingController();

  final TextEditingController _otpController4 = TextEditingController();
  var token = Token();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgotPasswordPage()));
                        },
                        icon: const Icon(Icons.arrow_back_ios)),
                    Container(
                      alignment: Alignment.center,
                      height: 150,
                      width: 150,
                      padding: const EdgeInsets.all(10),
                      child: Image.asset('assets/images/logo.png'),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.all(10),
                      child: const Text(
                        "Enter Verification Code",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.only(left: 10),
                      child: const Text(
                        "We have sent the OTP code to your email.",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Form(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 45,
                            width: 40,
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              decoration: const InputDecoration(
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w200),
                                border: OutlineInputBorder(),
                              ),
                              style: Theme.of(context).textTheme.headline6,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                              ],
                              controller: _otpController1,
                            ),
                          ),
                          SizedBox(
                            height: 45,
                            width: 40,
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              decoration: const InputDecoration(
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w200),
                                border: OutlineInputBorder(),
                              ),
                              style: Theme.of(context).textTheme.headline6,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                              ],
                              controller: _otpController2,
                            ),
                          ),
                          SizedBox(
                            height: 45,
                            width: 40,
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              decoration: const InputDecoration(
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w200),
                                border: OutlineInputBorder(),
                              ),
                              style: Theme.of(context).textTheme.titleLarge,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                              ],
                              controller: _otpController3,
                            ),
                          ),
                          SizedBox(
                            height: 45,
                            width: 40,
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              decoration: const InputDecoration(
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w200),
                                border: OutlineInputBorder(),
                              ),
                              style: Theme.of(context).textTheme.headline6,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                              ],
                              controller: _otpController4,
                            ),
                          ),
                          SizedBox(
                            height: 45,
                            width: 40,
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              decoration: const InputDecoration(
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w200),
                                border: OutlineInputBorder(),
                              ),
                              style: Theme.of(context).textTheme.headline6,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 58,
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(254, 114, 76, 1),
                          ),
                          onPressed: () {
                            //
                            token.storage.read(key: 'otp').then((value) {
                              String otp = _otpController1.text +
                                  _otpController2.text +
                                  _otpController3.text +
                                  _otpController4.text;

                              if (value == otp) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ChangePasswordPage()),
                                );
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Wrong OTP",
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white);
                              }
                            });
                          },
                          child: const Text("Enter")),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
