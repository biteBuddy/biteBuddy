import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:frontend/ApiSerives/cart.dart';
import 'package:frontend/Cart/pages/CartMain.dart';
import 'package:frontend/common/theme.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CreditCardPage extends StatefulWidget {
  CreditCardPage({Key? key, required this.total}) : super(key: key);
  double total;
  @override
  _CreditCardPageState createState() => _CreditCardPageState();
}

class _CreditCardPageState extends State<CreditCardPage> {
  bool validated = false;
  bool validating = false;
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text("Card Information"),
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                CreditCardWidget(
                    onCreditCardWidgetChange: (p0) {},
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: cardHolderName,
                    cvvCode: cvvCode,
                    showBackView: isCvvFocused,
                    obscureCardNumber: true,
                    obscureCardCvv: true,
                    cardBgColor: Color.fromARGB(255, 0, 141, 213)),
                CreditCardForm(
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  onCreditCardModelChange: onCreditCardModelChange,
                  themeColor: Colors.blue,
                  formKey: formKey,
                  cardNumberDecoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Number',
                      hintText: 'xxxx xxxx xxxx xxxx'),
                  expiryDateDecoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Expired Date',
                      hintText: 'xx/xx'),
                  cvvCodeDecoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'CVV',
                      hintText: 'xxx'),
                  cardHolderDecoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Card Holder',
                  ),
                ),
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.5),
                        borderRadius: BorderRadius.circular(2)),
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Billing Address",
                            style: CustomTheme()
                                .totalPrice
                                .copyWith(letterSpacing: 0.1)),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.1),
                      borderRadius: BorderRadius.circular(20)),
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total", style: CustomTheme().totalStyle),
                      Text(
                        "Rs.${widget.total}",
                        style: CustomTheme()
                            .totalPrice
                            .copyWith(letterSpacing: 0.6),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width / 1.5,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 0, 141, 213),
                      borderRadius: BorderRadius.circular(30)),
                  child: TextButton(
                      onPressed: () async {
                        if (!validated) {
                          setState(() {
                            validating = true;
                          });
                          await Future.delayed(Duration(milliseconds: 3000));
                          setState(() {
                            validating = false;
                            validated = true;
                          });
                        } else {
                          await CartAPI.checkout(widget.total);
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: ((context) {
                            return CartMain();
                          })));
                        }
                      },
                      child: validating
                          ? LoadingAnimationWidget.discreteCircle(
                              color: CustomTheme().primaryColor1, size: 20)
                          : Text(
                              validated ? "Checkout" : "Validate",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Poppins",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300),
                            )),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
