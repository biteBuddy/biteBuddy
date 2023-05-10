import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

Dio stripeDio = Dio();
Future<void> initPaymentSheet() async {
  try {
    // 1. create payment intent on the server
    final data = await stripeDio.post('http://localhost:3000/api/v1/payment',
        options: Options(headers: {
          "authorization":
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NDRmYWFmNTg2NTg1NjgyMjA1YmM4NzAiLCJlbWFpbCI6Im5lcGFsaUBnbWFpbC5jb20iLCJpYXQiOjE2ODM2ODc5NDUsImV4cCI6MTY4MzczMTE0NX0.WLTMU8AbnXiw4JtqDA2BQwKF5wI00CoyQ_UL6E1ht6k"
        }));
    print(data.data);
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        // Enable custom flow
        customFlow: true,
        // Main params
        merchantDisplayName: 'Flutter Stripe Store Demo',
        paymentIntentClientSecret: data.data['paymentIntent'],
      ),
    );
  } on StripeConfigException catch (e) {
    print((e));
  } on DioError catch (e) {
    print(e.message);
  }
}
