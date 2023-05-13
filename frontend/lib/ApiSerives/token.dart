import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Token {
  final storage = const FlutterSecureStorage();
  Future<String> getToken() async {
    try {
      final token = await storage.read(key: "token") as String;
      return token;
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          backgroundColor: Colors.red,
          textColor: Colors.white);
    }
    return "";
  }

  Future<bool> setToken(String token) async {
    try {
      await storage.write(key: "token", value: token) as String;
      return true;
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          backgroundColor: Colors.red,
          textColor: Colors.white);
    }
    return false;
  }
}
