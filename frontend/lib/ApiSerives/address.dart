import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:frontend/ApiSerives/token.dart';

Dio addressDio = new Dio();

class AddressAPI {
  static Future addAddress() async {
    try {
      String token = await Token().getToken();
      final address = await addressDio.post("http://localhost:3000/api/v1/",
          options: Options(headers: {"authorization": "Bearer ${token}"}));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.message.toString(),
          backgroundColor: Colors.red,
          textColor: Colors.white);
    }
  }
}
