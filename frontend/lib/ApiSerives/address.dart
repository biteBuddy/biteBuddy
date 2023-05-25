import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:frontend/ApiSerives/token.dart';
import 'package:frontend/Cart/model/address.dart';
import 'package:frontend/pages/address.dart';

Dio addressDio = new Dio();

class AddressAPI {
  static Future addAddress(Adddress address) async {
    try {
      String token = await Token().getToken();
      final _address = await addressDio.post(
          "http://localhost:3000/api/v1/address",
          data: addressToJson(address),
          options: Options(headers: {"authorization": "Bearer ${token}"}));
      print(_address.data);
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.message.toString(),
          backgroundColor: Colors.red,
          textColor: Colors.white);
    }
  }
}
