import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:fluttertoast/fluttertoast.dart';

var dio = new Dio();

class UserAPI {
  Future forgotPassword(String email) async {
    try {
      var res = await dio.post(
          "http://localhost:3000/api/v1/user/forgotPassword",
          data: {"email": email});
      return true;
    } on DioError catch (e) {
      print(e.message);
      Fluttertoast.showToast(msg: "${e.message}");
    }
  }

  Future<bool> checkOtp(String otp, String email) async {
    try {
      var res = await dio.post("http://localhost:3000/api/v1/user/checkOtp",
          data: {"otp": otp, "email": email});
      return true;
    } on DioError catch (e) {
      Fluttertoast.showToast(msg: e.message.toString());
      return false;
    }
  }
}
